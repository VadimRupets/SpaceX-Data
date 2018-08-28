//
//  CoreBoostersDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class CoreBoostersDispatcherTests: XCTestCase {
    
    func testDispatchAllCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
            
        // Given: CoreBoostersDispatcher object and CoreBoostersRequest.allCoreBoosters request
        let dispatcher = CoreBoostersDispatcher()
        let allCoreBoostersRequest = CoreBoostersRequest.allCoreBoosters
            
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(allCoreBoostersRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
            
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispacthCoreBoostersRequestWithoutFilters() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and CoreBoostersRequest without filters
        let dispatcher = CoreBoostersDispatcher()
        let coreBoostersRequestWithoutFilters = CoreBoostersRequest.filtered(by: [])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(coreBoostersRequestWithoutFilters) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredBySerialNumberCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and filtered by serial number core boosters request
        let dispatcher = CoreBoostersDispatcher()
        let filteredBySerialNumberCoreBoostersRequest = CoreBoostersRequest.filtered(by: [.serialNumber("B1041")])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredBySerialNumberCoreBoostersRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredByBlockCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and filtered by block core boosters request
        let dispatcher = CoreBoostersDispatcher()
        let filteredByBlockCoreBoosterRequest = CoreBoostersRequest.filtered(by: [.block(4)])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredByBlockCoreBoosterRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredByStatusCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and CoreBoostersRequest filtered by status
        let dispatcher = CoreBoostersDispatcher()
        let filteredByStatusCoreBoosterRequest = CoreBoostersRequest.filtered(by: [.status(.active)])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredByStatusCoreBoosterRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredByOriginalLaunchDateCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and filtered by original launch date core boosters request
        let dispatcher = CoreBoostersDispatcher()
        let originalLaunchDate = DateFormatter.ISO8601.date(from: "2017-10-09T12:37:00.000Z")!
        let filteredByOriginalLaunchDateCoreBoosterRequest = CoreBoostersRequest.filtered(by: [.originalLaunchDate(originalLaunchDate)])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredByOriginalLaunchDateCoreBoosterRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredByMissionsCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and filtered by missions core boosters request
        let dispatcher = CoreBoostersDispatcher()
        let missions = ["SpaceX CRS-3"]
        let filteredByMissionsСoreBoostersRequest = CoreBoostersRequest.filtered(by: [.missions(missions)])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredByMissionsСoreBoostersRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredByRTLSLandingAttemptsCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and filtered by RTLS Landing attempts core boosters request
        let dispatcher = CoreBoostersDispatcher()
        let filteredByRTLSLandingAttemptsCoreBoostersRequest = CoreBoostersRequest.filtered(by: [.rtlsAttempt(true)])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredByRTLSLandingAttemptsCoreBoostersRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredByRTLSLandingsCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and filtered by RTLS landings core boosters request
        let dispatcher = CoreBoostersDispatcher()
        let filteredByRTLSLandingsCoreBoostersRequest = CoreBoostersRequest.filtered(by: [.rtlsLandings(2)])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredByRTLSLandingsCoreBoostersRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredByASDSLandingAttemptsCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and filtered by ASDS landing attempts core boosters request
        let dispatcher = CoreBoostersDispatcher()
        let filteredByASDSLandingAttemptsCoreBoostersRequest = CoreBoostersRequest.filtered(by: [.asdsAttempt(true)])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredByASDSLandingAttemptsCoreBoostersRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredByASDSLandingsCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and filtered by ASDS landings core boosters request
        let dispatcher = CoreBoostersDispatcher()
        let filteredByASDSLandingsCoreBoostersRequest = CoreBoostersRequest.filtered(by: [.asdsLandings(2)])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredByASDSLandingsCoreBoostersRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
    func testDispatchFilteredWaterLandingAttemptsCoreBoostersRequest() {
        let successExpectation = expectation(description: "Core boosters")
        
        // Given: CoreBoostersDispatcher object and filtered by water landing core boosters request
        let dispatcher = CoreBoostersDispatcher()
        let filteredWaterLandingAttemptsCoreBoostersRequest = CoreBoostersRequest.filtered(by: [.waterLanding(true)])
        
        // When: dispatcher executes given request
        var returnedCoreBoosters: [CoreBooster] = []
        dispatcher.executeRequest(filteredWaterLandingAttemptsCoreBoostersRequest) { response in
            if case let .data(coreBoosters) = response {
                returnedCoreBoosters = coreBoosters
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with CoreBooster structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedCoreBoosters.count > 0)
    }
    
}
