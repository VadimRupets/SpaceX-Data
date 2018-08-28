//
//  RoadsterInfoDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class RoadsterInfoDispatcherTests: XCTestCase {
    
    func testDispatchRoadsterInfoRequest() {
        let successExpectation = expectation(description: "Roadster Info")
        
        // Given: RoadsterInfoDispatcher object and roadster info request
        let dispatcher = RoadsterInfoDispatcher()
        let roadsterInfoRequest = RoadsterInfoRequest.roadsterInfo
        
        // When: dispatcher executes given request
        var returnedRoadsterInfo: RoadsterInfo?
        dispatcher.executeRequest(roadsterInfoRequest) { response in
            if case let .data(roadsterInfo) = response {
                returnedRoadsterInfo = roadsterInfo
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil roadster info
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedRoadsterInfo)
    }
    
}
