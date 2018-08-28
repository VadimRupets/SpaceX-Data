//
//  CoreBoosterDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class CoreBoosterDispatcherTests: XCTestCase {
    
    func testDispatchCoreBoosterRequestWithValidCoreBoosterId() {
        let successExpectation = expectation(description: "Core Booster")
        
        // Given: CoreBoosterDispatcher object and CoreBoosterRequest with valid core booster id
        let dispatcher = CoreBoosterDispatcher()
        let coreBoosterRequest = CoreBoosterRequest(coreSerialNumber: "B1041")
        
        // When: dispatcher executes given request
        var returnedCoreBooster: CoreBooster?
        dispatcher.executeRequest(coreBoosterRequest) { response in
            if case let .data(coreBooster) = response {
                returnedCoreBooster = coreBooster
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil core booster
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedCoreBooster)
    }
    
    func testDispatchCoreBoosterRequestWithInvalidCoreBoosterId() {
        let errorExpectation = expectation(description: "Error")
        let successExpectation = expectation(description: "Success")
        successExpectation.isInverted = true
        
        // Given: CoreBoosterDispatcher object and CoreBoosterRequest with invalid capsule id
        let dispatcher = CoreBoosterDispatcher()
        let coreBoosterRequest = CoreBoosterRequest(coreSerialNumber: "abcd")
        
        // When: dispatcher executes given request
        var returnedCoreBooster: CoreBooster?
        var returnedError: NetworkError?
        dispatcher.executeRequest(coreBoosterRequest) { response in
            if case let .data(coreBooster) = response {
                returnedCoreBooster = coreBooster
                successExpectation.fulfill()
            } else if case let .error(error) = response {
                returnedError = error as? NetworkError
                errorExpectation.fulfill()
            }
        }
        
        // Then: returns NetworkError.noData error
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(returnedCoreBooster)
        XCTAssertEqual(returnedError, NetworkError.noData)
    }
    
}
