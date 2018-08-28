//
//  RocketsDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class RocketsDispatcherTests: XCTestCase {
    
    func testDispatchAllRocketsRequest() {
        let successExpectation = expectation(description: "Rockets")
            
        // Given: RocketsDispatcher object and all rockets request
        let dispatcher = RocketsDispatcher()
        let allRocketsRequest = RocketsRequest.allRockets
            
        // When: dispatcher executes given request
        var returnedRockets: [Rocket] = []
        dispatcher.executeRequest(allRocketsRequest) { response in
            if case let .data(rockets) = response {
                returnedRockets = rockets
                successExpectation.fulfill()
            }
        }
            
        // Then: returns array with Rocket structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedRockets.count > 0)
    }
    
}
