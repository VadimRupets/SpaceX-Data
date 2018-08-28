//
//  CapsuleDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/21/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class CapsuleDispatcherTests: XCTestCase {
    
    func testDispatchCapsuleRequestWithValidCapsuleId() {
        let successExpectation = expectation(description: "Capsule")
        
        // Given: CapsuleDispatcher object and CapsuleRequest with valid capsule id
        let dispatcher = CapsuleDispatcher()
        let capsuleRequest = CapsuleRequest(capsuleId: "dragon2")
        
        // When: dispatcher executes given request
        var returnedCapsule: Capsule?
        dispatcher.executeRequest(capsuleRequest) { response in
            if case let .data(capsule) = response {
                returnedCapsule = capsule
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil capsule
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedCapsule)
    }
    
    func testDispatchCapsuleRequestWithInvalidCapsuleId() {
        let errorExpectation = expectation(description: "Error")
        let successExpectation = expectation(description: "Success")
        successExpectation.isInverted = true
        
        // Given: CapsuleDispatcher object and CapsuleRequest with invalid capsule id
        let dispatcher = CapsuleDispatcher()
        let capsuleRequest = CapsuleRequest(capsuleId: "abcd")
        
        // When: dispatcher executes given request
        var returnedCapsule: Capsule?
        var returnedError: NetworkError?
        dispatcher.executeRequest(capsuleRequest) { response in
            if case let .data(capsule) = response {
                returnedCapsule = capsule
                successExpectation.fulfill()
            } else if case let .error(error) = response {
                returnedError = error as? NetworkError
                errorExpectation.fulfill()
            }
        }
        
        // Then: returns NetworkError.noData error
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(returnedCapsule)
        XCTAssertEqual(returnedError, NetworkError.noData)
    }
    
}
