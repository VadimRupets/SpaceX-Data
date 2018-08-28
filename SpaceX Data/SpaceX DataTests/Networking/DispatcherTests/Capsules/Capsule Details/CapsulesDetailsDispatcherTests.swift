//
//  CapsulesDetailsDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/21/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class CapsulesDetailsDispatcherTests: XCTestCase {
    
    func testDispatchAllCapsulesDetailsRequest() {
        let successExpectation = expectation(description: "Capsule details")
        
        // Given: CapsulesDetailsDispatcher object and CapsulesDetailsRequest.allCapsules request
        let dispatcher = CapsulesDetailsDispatcher()
        let allCapsuleDetailsRequest = CapsulesDetailsRequest.allCapsules
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: [CapsuleDetails] = []
        dispatcher.executeRequest(allCapsuleDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CapsuleDetails structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsuleDetails.count > 0)
    }
    
    func testDispatchCapsulesDetailsRequestWithoutFilters() {
        let successExpectation = expectation(description: "Capsule details")
        
        // Given: CapsulesDetailsDispatcher object and CapsulesDetailsRequest without filters
        let dispatcher = CapsulesDetailsDispatcher()
        let capsulesDetailsRequestWithoutFilters = CapsulesDetailsRequest.filtered(by: [])
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: [CapsuleDetails] = []
        dispatcher.executeRequest(capsulesDetailsRequestWithoutFilters) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CapsuleDetails structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsuleDetails.count > 0)
    }
    
    func testDispatchFilteredByCapsuleSerialNumberCapsulesDetailsRequest() {
        let successExpectation = expectation(description: "Capsule details")
        
        // Given: CapsulesDetailsDispatcher object and filtered by capsule serial number capsules details request
        let dispatcher = CapsulesDetailsDispatcher()
        let filteredByCapsuleSerialNumberCapsulesDetailsRequest = CapsulesDetailsRequest.filtered(by: [.capsuleSerialNumber("C113")])
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: [CapsuleDetails] = []
        dispatcher.executeRequest(filteredByCapsuleSerialNumberCapsulesDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CapsuleDetails structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsuleDetails.count > 0)
    }
    
    func testDispatchFilteredByCapsuleIdCapsuleDetailsRequest() {
        let successExpectation = expectation(description: "Capsule details")
        
        // Given: CapsulesDetailsDispatcher object and filtered by capsule id capsules details request
        let dispatcher = CapsulesDetailsDispatcher()
        let filteredByCapsuleIdCapsulesDetailsRequest = CapsulesDetailsRequest.filtered(by: [.capsuleId("dragon1")])
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: [CapsuleDetails] = []
        dispatcher.executeRequest(filteredByCapsuleIdCapsulesDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CapsuleDetails structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsuleDetails.count > 0)
    }
    
    func testDispatchFilteredByStatusCapsuleDetailsRequest() {
        let successExpectation = expectation(description: "Capsule details")
        
        // Given: CapsulesDetailsDispatcher object and filtered by status capsules details request
        let dispatcher = CapsulesDetailsDispatcher()
        let filteredByStatusCapsulesDetailsRequest = CapsulesDetailsRequest.filtered(by: [.status(.active)])
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: [CapsuleDetails] = []
        dispatcher.executeRequest(filteredByStatusCapsulesDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CapsuleDetails structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsuleDetails.count > 0)
    }
    
    func testDispatchFilteredByOriginalLaunchDateCapsuleDetailsRequest() {
        let successExpectation = expectation(description: "Capsule details")
        
        // Given: CapsulesDetailsDispatcher object and filtered by original launch date capsules details request
        let dispatcher = CapsulesDetailsDispatcher()
        let originalLaunchDate = DateFormatter.ISO8601.date(from: "2017-08-14T16:31:00.000Z")!
        let filteredByOriginalLaunchDateCapsulesDetailsRequest = CapsulesDetailsRequest.filtered(by: [.originalLaunchDate(originalLaunchDate)])
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: [CapsuleDetails] = []
        dispatcher.executeRequest(filteredByOriginalLaunchDateCapsulesDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CapsuleDetails structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsuleDetails.count > 0)
    }
    
    func testDispatchFilteredByMissionsCapsuleDetailsRequest() {
        let successExpectation = expectation(description: "Capsule details")
        
        // Given: CapsulesDetailsDispatcher object and filtered by missions capsules details request
        let dispatcher = CapsulesDetailsDispatcher()
        let missions = ["SpaceX CRS-12"]
        let filteredByMissionsCapsulesDetailsRequest = CapsulesDetailsRequest.filtered(by: [.missions(missions)])
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: [CapsuleDetails] = []
        dispatcher.executeRequest(filteredByMissionsCapsulesDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CapsuleDetails structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsuleDetails.count > 0)
    }
    
    func testDispatchFilteredByLandingsCapsuleDetailsRequest() {
        let successExpectation = expectation(description: "Capsule details")
        
        // Given: CapsulesDetailsDispatcher object and filtered by landings capsules details request
        let dispatcher = CapsulesDetailsDispatcher()
        let filteredByLandingsCapsuleDetailsRequest = CapsulesDetailsRequest.filtered(by: [.landings(2)])
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: [CapsuleDetails] = []
        dispatcher.executeRequest(filteredByLandingsCapsuleDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CapsuleDetails structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsuleDetails.count > 0)
    }
    
    func testDispatchFilteredByTypeCapsuleDetailsRequest() {
        let successExpectation = expectation(description: "Capsule details")
        
        // Given: CapsulesDetailsDispatcher object and filtered by type capsules details request
        let dispatcher = CapsulesDetailsDispatcher()
        let filteredByTypeCapsuleDetailsRequest = CapsulesDetailsRequest.filtered(by: [.type(.dragon1_1)])
        
        // When: dispatcher executes given request
        var returnedCapsuleDetails: [CapsuleDetails] = []
        dispatcher.executeRequest(filteredByTypeCapsuleDetailsRequest) { response in
            if case let .data(capsuleDetails) = response {
                returnedCapsuleDetails = capsuleDetails
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CapsuleDetails structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCapsuleDetails.count > 0)
    }
    
}
