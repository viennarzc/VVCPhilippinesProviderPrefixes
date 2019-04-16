//
//  VVCPHMobileNetwork.swift
//  VVCPhilippinesProviderPrefixes
//
//  Created by SCI-Viennarz on 16/04/2019.
//  Copyright © 2019 VVCSoft. All rights reserved.
//

import Foundation
class VVCMobileNetwork: NSObject {
  private(set) var providers: [VVCProvider] = []

  override init() {
    super.init()
    initList()
  }

  private func initList() {
    if let data = loadJson(filename: "test") {
      self.providers = data
    }
    
  }
}

public struct VVCProvider: Decodable {
  var name: String
  var displayName: String
  var prefixes: [Int]
}

public func loadJson(filename fileName: String) -> [VVCProvider]? {
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
