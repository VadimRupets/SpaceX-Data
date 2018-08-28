//
//  RocketDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class RocketDispatcherTests: XCTestCase {
    
    func testDispatchRocketRequestWithValidRocketId() {
        let successExpectation = expectation(description: "Rocket")
        
        // Given: RocketDispatcher object and RocketRequest with valid rocket id
        let dispatcher = RocketDispatcher()
        let rocketRequest = RocketRequest(rocketId: "falcon9")
        
        // When: dispatcher executes given request
        var returnedRocket: Rocket?
        dispatcher.executeRequest(rocketRequest) { response in
            if case let .data(rocket) = response {
                returnedRocket = rocket
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil rocket
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedRocket)
    }
    
    func testDispatchRocketRequestWithInvalidRocketId() {
        let errorExpectation = expectation(description: "Error")
        let successExpectation = expectation(description: "Success")
        successExpectation.isInverted = true
        
        // Given: RocketDispatcher object and RocketRequest with invalid rocket id
        let dispatcher = RocketDispatcher()
        let rocketRequest = RocketRequest(rocketId: "abcd")
        
        // When: dispatcher executes given request
        var returnedRocket: Rocket?
        var returnedError: NetworkError?
        dispatcher.executeRequest(rocketRequest) { response in
            if case let .data(rocket) = response {
                returnedRocket = rocket
                successExpectation.fulfill()
            } else if case let .error(error) = response {
                returnedError = error as? NetworkError
                errorExpectation.fulfill()
            }
        }
        
        // Then: returns NetworkError.noData error
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(returnedRocket)
        XCTAssertEqual(returnedError, NetworkError.noData)
    }
    
}
