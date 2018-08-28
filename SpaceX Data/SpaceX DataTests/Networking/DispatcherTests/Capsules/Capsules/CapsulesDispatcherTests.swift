//
//  CapsulesDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/21/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class CapsulesDispatcherTests: XCTestCase {
    
    func testDispatchAllCapsulesRequest() {
        let successExpectation = expectation(description: "Capsules")
        
        // Given: CapsulesDispatcher object and CapsulesRequest.allCapsules request
        let dispatcher = CapsulesDispatcher()
        let allCapsulesRequest = CapsulesRequest.allCapsules
        
        // When: dispatcher executes given request
        var returnedCapsules: [Capsule] = []
        dispatcher.executeRequest(allCapsulesRequest) { response in
            if case let .data(capsules) = response {
                returnedCapsules = capsules
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Capsule structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsules.count > 0)
    }
    
}
