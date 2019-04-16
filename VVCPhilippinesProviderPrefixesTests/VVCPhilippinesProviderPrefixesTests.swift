//
//  VVCPhilippinesProviderPrefixesTests.swift
//  VVCPhilippinesProviderPrefixesTests
//
//  Created by SCI-Viennarz on 16/04/2019.
//  Copyright © 2019 VVCSoft. All rights reserved.
//

import XCTest
@testable import VVCPhilippinesProviderPrefixes
import Quick
import Nimble


class VVCPhilippinesProviderPrefixesTests: QuickSpec {
  override func spec() {
    describe("VVCPhilippinesProviderPrefixes") {
      it("is not Empty") {
        let a = VVCMobileNetwork()
        
        debugPrint(a.providers)
        expect(a.providers).notTo(beEmpty())
      }
    }
  }
}
