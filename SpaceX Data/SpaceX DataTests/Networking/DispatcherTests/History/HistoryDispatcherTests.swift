//
//  HistoryDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 11/19/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class HistoryDispatcherTests: XCTestCase {
    
    func testDispatchAllMilestonesHistoryRequest() {
        let successExpectation = expectation(description: "All milestones")
        
        // Given: HistoryDispatcher object and all milestones request
        let dispatcher = HistoryDispatcher()
        let allMilestonesRequest = HistoryRequest.allMilestones
        
        // When: dispatcher executes given request
        var returnedMilestones: [Milestone]?
        dispatcher.executeRequest(allMilestonesRequest) { response in
            if case let .data(milestones) = response {
                returnedMilestones = milestones
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil launch
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedMilestones)
    }
    
    func testDispatchFilteredByIdHistoryRequest() {
        let successExpectation = expectation(description: "Milestone with id = 1")
        
        // Given: HistoryDispatcher object and filtered by id history request
        let dispatcher = HistoryDispatcher()
        let allMilestonesRequest = HistoryRequest.filtered(by: [.id(1)])
        
        // When: dispatcher executes given request
        var returnedMilestones: [Milestone]?
        dispatcher.executeRequest(allMilestonesRequest) { response in
            if case let .data(milestones) = response {
                returnedMilestones = milestones
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil launch
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedMilestones)
    }
    
    func testDispatchFilteredByOrderHistoryRequest() {
        let successExpectation = expectation(description: "All milestones in descending order")
        
        // Given: HistoryDispatcher object and filtered by descending order request
        let dispatcher = HistoryDispatcher()
        let allMilestonesRequest = HistoryRequest.filtered(by: [.order(.orderedDescending)])
        
        // When: dispatcher executes given request
        var returnedMilestones: [Milestone]?
        dispatcher.executeRequest(allMilestonesRequest) { response in
            if case let .data(milestones) = response {
                returnedMilestones = milestones
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil launch
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedMilestones)
    }
    
    func testDispatchFilteredByDateRangeHistoryRequest() {
        let successExpectation = expectation(description: "Milestones in particular date range")
        
        let startDate = DateFormatter.yyyyMMdd.date(from: "2010-01-01")!
        let endDate = DateFormatter.yyyyMMdd.date(from: "2010-06-01")!
        
        // Given: HistoryDispatcher object and filtered by date range history request
        let dispatcher = HistoryDispatcher()
        let allMilestonesRequest = HistoryRequest.filtered(by: [.dateRange((startDate, endDate))])
        
        // When: dispatcher executes given request
        var returnedMilestones: [Milestone]?
        dispatcher.executeRequest(allMilestonesRequest) { response in
            if case let .data(milestones) = response {
                returnedMilestones = milestones
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil launch
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedMilestones)
    }
    
    func testDispatchFilteredByFlightNumberHistoryRequest() {
        let successExpectation = expectation(description: "Milestone with flight number = 1")
        
        // Given: HistoryDispatcher object and filtered by flight number history request
        let dispatcher = HistoryDispatcher()
        let allMilestonesRequest = HistoryRequest.filtered(by: [.flightNumber(1)])
        
        // When: dispatcher executes given request
        var returnedMilestones: [Milestone]?
        dispatcher.executeRequest(allMilestonesRequest) { response in
            if case let .data(milestones) = response {
                returnedMilestones = milestones
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil launch
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedMilestones)
    }
    
}
