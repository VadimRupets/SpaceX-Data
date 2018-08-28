//
//  LaunchpadDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class LaunchpadDispatcherTests: XCTestCase {
    
    func testDispatchLaunchpadRequestWithValidLaunchpadId() {
        let successExpectation = expectation(description: "Launchpad")
        
        // Given: LaunchpadDispatcher object and LaunchpadRequest with valid launchpad id
        let dispatcher = LaunchpadDispatcher()
        let launchpadRequest = LaunchpadRequest(launchpadId: "ksc_lc_39a")
        
        // When: dispatcher executes given request
        var returnedLaunchpad: Launchpad?
        dispatcher.executeRequest(launchpadRequest) { response in
            if case let .data(launchpad) = response {
                returnedLaunchpad = launchpad
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil launchpad
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedLaunchpad)
    }
    
    func testDispatchLaunchpadRequestWithInvalidLaunchpadId() {
        let errorExpectation = expectation(description: "Error")
        let successExpectation = expectation(description: "Success")
        successExpectation.isInverted = true
        
        // Given: LaunchpadDispatcher object and LaunchpadRequest with invalid launchpad id
        let dispatcher = LaunchpadDispatcher()
        let launchpadRequest = LaunchpadRequest(launchpadId: "abcd")
        
        // When: dispatcher executes given request
        var returnedLaunchpad: Launchpad?
        var returnedError: NetworkError?
        dispatcher.executeRequest(launchpadRequest) { response in
            if case let .data(launchpad) = response {
                returnedLaunchpad = launchpad
                successExpectation.fulfill()
            } else if case let .error(error) = response {
                returnedError = error as? NetworkError
                errorExpectation.fulfill()
            }
        }
        
        // Then: returns NetworkError.noData error
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(returnedLaunchpad)
        XCTAssertEqual(returnedError, NetworkError.noData)
    }
    
}
