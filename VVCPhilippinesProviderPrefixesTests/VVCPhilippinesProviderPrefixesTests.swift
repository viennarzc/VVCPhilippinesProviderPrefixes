//
//  VVCPhilippinesProviderPrefixesTests.swift
//  VVCPhilippinesProviderPrefixesTests
//
//  Created by Viennarz on 16/04/2019.
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
        
        debugPrint(a.providers[0].prefixes)
        expect(a.providers).notTo(beEmpty())
      }
    }
    
    context("Globe Network") {
      it("is globe number") {
        let a = VVCMobileNetwork()
        let isGlobe = a.provider(contactNumber: "09733012090")

        expect(isGlobe).to(equal(VVCMobileNetwork.NetworkProvider.globe))
      }
    }
    
    context("Sun Cell  Network") {
      it("is Sun Cellular number") {
        let a = VVCMobileNetwork()
        let isGlobe = a.provider(contactNumber: "09223025090")
        
        expect(isGlobe).to(equal(VVCMobileNetwork.NetworkProvider.sun))
      }
    }
    
    context("Globe Prepaid") {
      it("is Globe Prepaid number") {
        let a = VVCMobileNetwork()
        let isGlobe = a.provider(contactNumber: "09175012090")
        
        expect(isGlobe).to(equal(VVCMobileNetwork.NetworkProvider.globeprepaid))
      }
    }
    
    context("Smart Network") {
      it("is Smart number") {
        let a = VVCMobileNetwork()
        let isGlobe = a.provider(contactNumber: "09283012078")
        
        expect(isGlobe).to(equal(VVCMobileNetwork.NetworkProvider.smart))
      }
    }
    
    context("Globe / TM") {
      it("is GLOBE/TM number") {
        let a = VVCMobileNetwork()
        let isGlobe = a.provider(contactNumber: "09063012090")
        
        expect(isGlobe).to(equal(VVCMobileNetwork.NetworkProvider.globetm))
      }
    }
    
    context("Talk N Text Network") {
      it("is TNT number") {
        let a = VVCMobileNetwork()
        let isGlobe = a.provider(contactNumber: "09483078890")
        
        expect(isGlobe).to(equal(VVCMobileNetwork.NetworkProvider.tnt))
      }
    }
  }

}
