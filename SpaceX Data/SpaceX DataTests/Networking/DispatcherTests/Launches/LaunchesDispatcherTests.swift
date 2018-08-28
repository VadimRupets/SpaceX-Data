//
//  LaunchesDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/22/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class LaunchesDispatcherTests: XCTestCase {
    
    func testDispatchPastLaunchesRequest() {
        let successExpectation = expectation(description: "Past launches")
        
        // Given: LaunchesDispatcher object and past launches request
        let dispatcher = LaunchesDispatcher()
        let pastLaunchesRequest = LaunchesRequest.pastLaunches
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(pastLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchUpcomingLaunchesRequest() {
        let successExpectation = expectation(description: "Upcoming launches")
        
        // Given: LaunchesDispatcher object and upcoming launches request
        let dispatcher = LaunchesDispatcher()
        let upcomingLaunchesRequest = LaunchesRequest.upcomingLaunches
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(upcomingLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchAllLaunchesRequest() {
        let successExpectation = expectation(description: "All launches")
        
        // Given: LaunchesDispatcher object and all launches request
        let dispatcher = LaunchesDispatcher()
        let allLaunchesRequest = LaunchesRequest.allLaunches
        
        // When: dispatcher executes all launches request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(allLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByOrderLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by order launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByOrderLaunchesRequest = LaunchesRequest.filtered(by: [.order(.orderedAscending)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByOrderLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByDateRangeLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filterd by date range launches request
        let dispatcher = LaunchesDispatcher()
        let startDate = DateFormatter.yyyyMMdd.date(from: "2017-01-01")!
        let endDate = DateFormatter.yyyyMMdd.date(from: "2018-01-01")!
        let filteredByDateRangeLaunchesRequest = LaunchesRequest.filtered(by: [.dateRange((startDate: startDate, endDate: endDate))])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByDateRangeLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByFlightNumberLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by flight number launches request
        let dispatcher = LaunchesDispatcher()
        let fliteredByFlightNumberLaunchesRequest = LaunchesRequest.filtered(by: [.flightNumber(60)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(fliteredByFlightNumberLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByLaunchYearLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by launch year launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByLaunchYearLaunchesRequest = LaunchesRequest.filtered(by: [.launchYear(2018)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByLaunchYearLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByLaunchDateLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by launch date launches request
        let dispatcher = LaunchesDispatcher()
        let launchDate = DateFormatter.ISO8601.date(from: "2006-03-24T22:30:00.000Z")!
        let filteredByLaunchDateLaunchesRequest = LaunchesRequest.filtered(by: [.launchDate(launchDate)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByLaunchDateLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByRocketIdLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by rocket id launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByRocketIdLaunchesRequest = LaunchesRequest.filtered(by: [.rocketId("falconheavy")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByRocketIdLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByRocketNameLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by rocket name launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByRocketNameLaunchesRequest = LaunchesRequest.filtered(by: [.rocketName("Falcon Heavy")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByRocketNameLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByRocketTypeLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by rocket type launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByRocketTypeLaunchesRequest = LaunchesRequest.filtered(by: [.rocketType("FT")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByRocketTypeLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchfilteredByCoreBoosterSerialNumberLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by core booster serial number launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByCoreBoosterSerialNumberLaunchesRequest = LaunchesRequest.filtered(by: [.coreBoosterSerialNumber("B1045")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByCoreBoosterSerialNumberLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByCapsuleSerialNumberLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by capsule serial number launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByCapsuleSerialNumberLaunchesRequest = LaunchesRequest.filtered(by: [.capsuleSerialNumber("C113")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByCapsuleSerialNumberLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByNumberOfPreviousCoreBoosterFlightsLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by number of previous core booster flights launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByNumberOfPreviousCoreBoosterFlightsLaunchesRequest = LaunchesRequest.filtered(by: [.numberOfPreviousCoreBoosterFlights(2)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByNumberOfPreviousCoreBoosterFlightsLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByCoreBoosterBlockNumberLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by core booster block number launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByCoreBoosterBlockNumberLaunchesRequest = LaunchesRequest.filtered(by: [.coreBoosterBlockNumber(5)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByCoreBoosterBlockNumberLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByMainCoreBoosterReusedLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by main core booster reused launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByMainCoreBoosterReusedLaunchesRequest = LaunchesRequest.filtered(by: [.mainCoreBoosterReused(true)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByMainCoreBoosterReusedLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredBySideCoreBooster1ReusedLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by side core booster 1 reused launches request
        let dispatcher = LaunchesDispatcher()
        let filteredBySideCoreBooster1ReusedLaunchesRequest = LaunchesRequest.filtered(by: [.sideCoreBooster1Reused(true)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredBySideCoreBooster1ReusedLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredBySideCoreBooster2ReusedLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object filtered by side core booster 2 reused launches request
        let dispatcher = LaunchesDispatcher()
        let filteredBySideCoreBooster2ReusedLaunchesRequest = LaunchesRequest.filtered(by: [.sideCoreBooster2Reused(true)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredBySideCoreBooster2ReusedLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByFairingsReusedLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by fairings reused launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByFairingsReusedLaunchesRequest = LaunchesRequest.filtered(by: [.fairingsReused(false)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByFairingsReusedLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByCapsuleReusedLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by capsule reused launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByCapsuleReusedLaunchesRequest = LaunchesRequest.filtered(by: [.capsuleReused(true)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByCapsuleReusedLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByLaunchSiteIdLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by launch site id launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByLaunchSiteIdLaunchesRequest = LaunchesRequest.filtered(by: [.launchSiteId("ksc_lc_39a")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByLaunchSiteIdLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByLaunchSiteNameLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by launch site name launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByLaunchSiteNameLaunchesRequest = LaunchesRequest.filtered(by: [.launchSiteName("KSC LC 39A")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByLaunchSiteNameLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByLaunchSiteLongNameLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by launch site long name launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByLaunchSiteLongNameLaunchesRequest = LaunchesRequest.filtered(by: [.launchSiteLongName("Kennedy Space Center Historic Launch Complex 39A")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByLaunchSiteLongNameLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByPayloadIdLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by payload id launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByPayloadIdLaunchesRequest = LaunchesRequest.filtered(by: [.payloadId("BulgariaSat-1")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByPayloadIdLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByNoradIdLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by norad id launches request
        let dispatcher = LaunchesDispatcher()
        let FilteredByNoradIdLaunchesRequest = LaunchesRequest.filtered(by: [.noradId(43571)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(FilteredByNoradIdLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByCustomerLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by customer launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByCustomerLaunchesRequest = LaunchesRequest.filtered(by: [.customer("DARPA")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByCustomerLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByNationalityLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by nationality launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByNationalityLaunchesRequest = LaunchesRequest.filtered(by: [.nationality("Bulgaria")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByNationalityLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByManufacturerLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by manufacturer launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByManufacturerLaunchesRequest = LaunchesRequest.filtered(by: [.manufacturer("SSL")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByManufacturerLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByPayloadTypeLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by payload type launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByPayloadTypeLaunchesRequest = LaunchesRequest.filtered(by: [.payloadType("Satellite")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByPayloadTypeLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByOrbitLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by orbit launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByOrbitLaunchesRequest = LaunchesRequest.filtered(by: [.orbit("GTO")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByOrbitLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredBySuccessfulLaunchLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by successful launch launches request
        let dispatcher = LaunchesDispatcher()
        let filteredBySuccessfulLaunchLaunchesRequest = LaunchesRequest.filtered(by: [.successfulLaunch(true)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredBySuccessfulLaunchLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByReusedCoresLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by reused cores launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByReusedCoresLaunchesRequest = LaunchesRequest.filtered(by: [.reusedCores(true)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByReusedCoresLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredBySuccessfulLandingLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by successful landing launches request
        let dispatcher = LaunchesDispatcher()
        let filteredBySuccessfulLandingLaunchesRequest = LaunchesRequest.filtered(by: [.successfulLanding(true)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredBySuccessfulLandingLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByLandingTypeLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by landing type launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByLandingTypeLaunchesRequest = LaunchesRequest.filtered(by: [.landingType(.asds)])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByLandingTypeLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
    func testDispatchFilteredByLandingVehicleLaunchesRequest() {
        let successExpectation = expectation(description: "Filtered launches")
        
        // Given: LaunchesDispatcher object and filtered by landing vehicle launches request
        let dispatcher = LaunchesDispatcher()
        let filteredByLandingVehicleLaunchesRequest = LaunchesRequest.filtered(by: [.landingVehicle("OCISLY")])
        
        // When: dispatcher executes given request
        var returnedLaunches: [Launch] = []
        dispatcher.executeRequest(filteredByLandingVehicleLaunchesRequest) { response in
            if case let .data(launches) = response {
                returnedLaunches = launches
                successExpectation.fulfill()
            }
        }
        
        // Then: returns array with Launch structs
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(returnedLaunches.count > 0)
    }
    
}
