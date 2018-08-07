//
//  RocketRequests.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/24/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

public enum RocketRequests: String, Request {
    case
    falcon1,
    falcon9,
    falconHeavy,
    bfr
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var endpoint: String {
        return "rockets/".appending(rawValue)
    }
    
    public var parameters: [String : Any]? {
        return nil
    }
}
