//
//  CompanyInfoDispatcherTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/20/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class CompanyInfoDispatcherTests: XCTestCase {
    
    func testDispatchCompanyInfoRequest() {
        let successExpectation = expectation(description: "Company Info")
        
        // Given: CompanyInfoDispatcher object and companyInfo request
        let dispatcher = CompanyInfoDispatcher()
        let companyInfoRequest = CompanyInfoRequest.companyInfo
        
        // When: dispatcher executes given request
        var returnedCompanyInfo: CompanyInfo?
        dispatcher.executeRequest(companyInfoRequest) { response in
            if case let .data(companyInfo) = response {
                returnedCompanyInfo = companyInfo
                successExpectation.fulfill()
            }
        }
        
        // Then: returns non-nil company info
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(returnedCompanyInfo)
    }
    
}
