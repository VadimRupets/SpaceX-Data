//
//  LaunchDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/22/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class LaunchDispatcherTests: XCTestCase {
    
    func testDispatchLatestLaunchRequest() {
        let successExpectation = expectation(description: "Latest launch")
        
        // Given: LaunchDispatcher object and latest launch request
        let dispatcher = LaunchDispatcher()
        let latestLaunchRequest = LaunchRequest.latest
        
        // When: dispatcher executes given request
        var returnedLaunch: Launch?
        dispatcher.executeRequest(latestLaunchRequest) { response in
            if case let .data(launch) = response {
                returnedLaunch = launch
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil launch
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedLaunch)
    }
    
    func testDispatchNextLaunchRequest() {
        let successExpectation = expectation(description: "Next launch")
        
        // Given: LaunchDispatcher object and next launch request
        let dispatcher = LaunchDispatcher()
        let nextLaunchRequest = LaunchRequest.next
        
        // When: dispatcher executes given request
        var returnedLaunch: Launch?
        dispatcher.executeRequest(nextLaunchRequest) { response in
            if case let .data(launch) = response {
                returnedLaunch = launch
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil launch
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedLaunch)
    }
    
}
