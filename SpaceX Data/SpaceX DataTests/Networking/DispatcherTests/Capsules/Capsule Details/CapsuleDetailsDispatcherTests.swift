//
//  CapsuleDetailsDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/21/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data
class CapsuleDetailsDispatcherTests: XCTestCase {
    
    func testDispatchCapsuleDetailsRequestWithValidCapsuleSerialNumber() {
        let successExpectation = expectation(description: "Capsule Details")
        
        // Given: CapsuleDetailsDispatcher object and CapsuleDetailsRequest with valid capsule serial number
        let dispatcher = CapsuleDetailsDispatcher()
        let capsuleDetailsRequest = CapsuleDetailsRequest(capsuleSerialNumber: "C113")
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: CapsuleDetails?
        dispatcher.executeRequest(capsuleDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil capsule details
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedCapsuleDetails)
    }
    
    func testDispatchCapsuleDetailsRequestWithInvalidCapsuleSerialNumber() {
        let errorExpectation = expectation(description: "Error")
        let successExpectation = expectation(description: "Success")
        successExpectation.isInverted = true
        
        // Given: CapsuleDetailsDispatcher object and CapsuleDetailsRequest with invalid launchpad id
        let dispatcher = CapsuleDetailsDispatcher()
        let capsuleDetailsRequest = CapsuleDetailsRequest(capsuleSerialNumber: "abcd")
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: CapsuleDetails?
        var returnedError: NetworkError?
        dispatcher.executeRequest(capsuleDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            } else if case let .error(error) = response {
                returnedError = error as? NetworkError
                errorExpectation.fulfill()
            }
        }
        
        // Then: returns NetworkError.noData error
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(returnedCapsuleDetails)
        XCTAssertEqual(returnedError, NetworkError.noData)
    }
    
}
