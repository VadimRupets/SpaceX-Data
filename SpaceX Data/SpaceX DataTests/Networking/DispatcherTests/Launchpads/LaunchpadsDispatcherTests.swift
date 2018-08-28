//
//  LaunchpadsDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class LaunchpadsDispatcherTests: XCTestCase {
    
    func testDispatchAllLaunchpadsRequest() {
        let successExpectation = expectation(description: "Launchpads")
        
        // Given: LaunchpadsDispatcher object and all launchpads request
        let dispatcher = LaunchpadsDispatcher()
        let request = LaunchpadsRequest.allLaunchpads
        
        // When: dispatcher executes given request
        var returnedLaunchpads: [Launchpad] = []
        dispatcher.executeRequest(request) { response in
            if case let .data(launchpads) = response {
                returnedLaunchpads = launchpads
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launchpad structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunchpads.count > 0)
    }
    
}
