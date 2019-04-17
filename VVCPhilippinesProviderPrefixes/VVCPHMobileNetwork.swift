//
//  VVCPHMobileNetwork.swift
//  VVCPhilippinesProviderPrefixes
//
//  Created by Viennarz on 16/04/2019.
//  Copyright © 2019 VVCSoft. All rights reserved.
//

//  Source of list of prefixes: https://www.prefix.ph/prefixes/2019-updated-complete-list-of-philippine-mobile-network-prefixes/

import Foundation
class VVCMobileNetwork: NSObject {
  private(set) var providers: [VVCProvider] = []

  enum NetworkProvider {
    case globe
    case tnt
    case globetm
    case smart
    case sun
    case globeprepaid
  }

  override init() {
    super.init()
    initList()
  }

  private func initList() {
    if let data = loadJson(filename: "test") {
      self.providers = data
    }


  }

  public func provider(contactNumber: String) -> NetworkProvider? {

    if isGlobe(number: contactNumber) {
      return .globe
      
    } else if isSun(number: contactNumber) {
      return .sun
      
    } else if isTNT(number: contactNumber) {
      return .tnt
      
    } else if isGlobePrepaid(number: contactNumber) {
      return .globeprepaid
      
    } else if isGlobeTM(number: contactNumber) {
      return .globetm
      
    } else if isSmart(number: contactNumber) {
      return .smart
      
    }

    return nil
  }


  private func isGlobe(number: String) -> Bool {
    let globe = self.providers.filter { $0.name == "globe" }
    var number = number

    if number.hasPrefix("09") {
      number = String(number.dropFirst())
    }

    guard let g = globe.first else { return false }

    return doMatch(prefixes: g.prefixes, with: number)
  }

  private func isSun(number: String) -> Bool {
    let sun = self.providers.filter { $0.name == "sun" }
    var number = number

    if number.hasPrefix("09") {
      number = String(number.dropFirst())
    }

    guard let s = sun.first else { return false }

    return doMatch(prefixes: s.prefixes, with: number)
  }

  private func isSmart(number: String) -> Bool {
    let smart = self.providers.filter { $0.name == "smart" }
    var number = number

    if number.hasPrefix("09") {
      number = String(number.dropFirst())
    }

    guard let s = smart.first else { return false }

    return doMatch(prefixes: s.prefixes, with: number)
  }

  private func isTNT(number: String) -> Bool {
    let tnt = self.providers.filter { $0.name == "tnt" }
    var number = number

    if number.hasPrefix("09") {
      number = String(number.dropFirst())
    }

    guard let s = tnt.first else { return false }

    return doMatch(prefixes: s.prefixes, with: number)
  }

  private func isGlobePrepaid(number: String) -> Bool {
    let tnt = self.providers.filter { $0.name == "globeprepaid" }
    var number = number

    if number.hasPrefix("09") {
      number = String(number.dropFirst())
    }

    guard let s = tnt.first else { return false }

    return doMatch(prefixes: s.prefixes, with: number)
  }

  private func isGlobeTM(number: String) -> Bool {
    let tnt = self.providers.filter { $0.name == "globetm" }
    var number = number

    if number.hasPrefix("09") {
      number = String(number.dropFirst())
    }

    guard let s = tnt.first else { return false }

    return doMatch(prefixes: s.prefixes, with: number)
  }

  private func doMatch(prefixes: [String], with number: String) -> Bool {
    let regex = prefixes.joined(separator: "|")
    let pattern = "(" + regex + ")"

    let regexEx = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    return regexEx.firstMatch(in: number, options: [], range: NSRange(location: 0, length: number.count)) != nil
  }
}

public struct VVCProvider: Decodable {
  var name: String
  var displayName: String
  var prefixes: [String]
}

private func loadJson(filename fileName: String) -> [VVCProvider]? {
  let bundle = Bundle(for: VVCMobileNetwork.self)
  if let path = bundle.path(forResource: "Resources.bundle/telcos", ofType: "json") {
    do {
      let url = URL(fileURLWithPath: path)
      let data = try Data(contentsOf: url)
      let decoder = JSONDecoder()
      let jsonData = try decoder.decode([VVCProvider].self, from: data)
      return jsonData
    } catch {
      print("error here:\(error)")
    }
  }
  return nil
}
