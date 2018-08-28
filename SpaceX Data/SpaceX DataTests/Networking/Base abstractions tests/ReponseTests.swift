//
//  ReponseTests.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/16/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import XCTest
@testable import SpaceX_Data

class ResponseTests: XCTestCase {
    
    var validData: Data {
        let validJSON = ["parameter": 42]
        return try! JSONSerialization.data(withJSONObject: validJSON)
    }
    
    var invalidTypeData: Data {
        let invalidTypeJSON = ["parameter": true]
        return try! JSONSerialization.data(withJSONObject: invalidTypeJSON)
    }
    
    let url = URL(string: "https://google.com")!
    
    func testInitResponseWithValidData() {
        MockDecodableObjectCodingKey = "parameter"
        
        // Given: HTTPURLResponse with 200 status code
        let httpURLResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // When: initializing Response enum case with valid data and nil error
        let response = Response<MockDecodableObject<Int>>(response: httpURLResponse, data: validData, error: nil)
        
        // Then: response object value equals 42
        if case .data(let value) = response {
            XCTAssertEqual(value.value, 42)
        } else {
            XCTFail()
        }
    }
    
    func testInitResponseWithNoData() {
        MockDecodableObjectCodingKey = "parameter"
        
        // Given: HTTPURLResponse with 200 status code
        let httpURLResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // When: initializing Response enum case with given HTTPURLResponse, nil data and nil error
        let response = Response<MockDecodableObject<Int>>(response: httpURLResponse, data: nil, error: nil)
        
        // Then: response object can't be decoded, returns NetworkError.noData error
        if case .error(let error) = response, let networkError = error as? NetworkError {
            XCTAssertEqual(networkError, NetworkError.noData)
        } else {
            XCTFail()
        }
    }
    
    func testInitResponseWithCustomNetworkError() {
        MockDecodableObjectCodingKey = "parameter"
        
        // Given: HTTPURLResponse with 200 status code
        let httpURLResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // When: initializing Response enum case with with given HTTPURLResponse, nil data and NetworkError.notReachable error
        let response = Response<MockDecodableObject<Int>>(response: httpURLResponse, data: nil, error: NetworkError.notReachable)
        
        // Then: response object can't be decoded, returns NetworkError.notReachable error
        if case .error(let error) = response, let networkError = error as? NetworkError {
            XCTAssertEqual(networkError, NetworkError.notReachable)
        } else {
            XCTFail()
        }
    }
    
    func testInitResponseWith404StatusCode() {
        MockDecodableObjectCodingKey = "parameter"
        
        // Given: HTTPURLResponse with 404 status code
        let httpURLResponse = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil, headerFields: nil)
        
        // When: initializing Response enum case with given HTTPURLResponse, nil data and nil error
        let response = Response<MockDecodableObject<Int>>(response: httpURLResponse, data: validData, error: nil)
        
        // Then: response object can't be decoded, returns NetworkError.noData error
        if case .error(let error) = response, let networkError = error as? NetworkError {
            XCTAssertEqual(networkError, NetworkError.noData)
        } else {
            XCTFail()
        }
    }
    
    func testInitResponseWithInvalidValueType() {
        MockDecodableObjectCodingKey = "parameter"
        
        // Given: HTTPURLResponse with 200 status code
        let httpURLResponse = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // When: initializing Response enum case with given HTTPURLResponse, invalid type data and nil error
        let response = Response<MockDecodableObject<Int>>(response: httpURLResponse, data: invalidTypeData, error: nil)
        
        // Then: response object can't be decoded, returns DecodingError error
        if case .error(let error) = response {
            XCTAssertTrue(error is DecodingError)
        } else {
            XCTFail()
        }
    }
    
    func testInitResponseWithNilHTTPURLResponseNilDataAndNilError() {
        // Given: nil HTTPURLResponse
        let httpURLResponse: HTTPURLResponse? = nil
        
        // When: initializing Response enum case with given HTTPURLResponse, nil data and nil error
        let response = Response<MockDecodableObject<Int>>(response: httpURLResponse, data: nil, error: nil)
        
        // Then: response object can't be decoded, returns NetworkError.noData error
        if case .error(let error) = response, let networkError = error as? NetworkError {
            XCTAssertEqual(networkError, NetworkError.noData)
        } else {
            XCTFail()
        }
    }
    
    func testInitResponseWithNilHTTPURLResponseNilDataAndNonNilError() {
        // Given: nil HTTPURLResponse
        let httpURLResponse: HTTPURLResponse? = nil
        
        // When: initializing Response enum case with given HTTPURLResponse, nil data and NetworkError.notReachable error
        let response = Response<MockDecodableObject<Int>>(response: httpURLResponse, data: nil, error: NetworkError.notReachable)
        
        // Then: response object can't be decoded, returns NetworkError.notReachable error
        if case .error(let error) = response, let networkError = error as? NetworkError {
            XCTAssertEqual(networkError, NetworkError.notReachable)
        } else {
            XCTFail()
        }
    }
    
}
