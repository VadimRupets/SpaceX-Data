//
//  MockDecodableObject.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/16/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation
@testable import SpaceX_Data

var MockDecodableObjectCodingKey = ""

class MockDecodableObject<T: Decodable>: Decodable {
    
    let value: T
    
    init(value: T) {
        self.value = value
    }
    
    enum CodingKeys: CodingKey {
        case value
        
        var stringValue: String {
            return MockDecodableObjectCodingKey
        }
    }
    
    init(decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.value = try values.decode(T.self, forKey: .value)
    }
}
