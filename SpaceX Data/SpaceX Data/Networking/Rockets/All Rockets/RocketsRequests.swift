//
//  RocketsRequests.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/7/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

public enum RocketsRequests: Request {
    case
    allRockets
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var endpoint: String {
        return "rockets"
    }
    
    public var parameters: [String : Any]? {
        return nil
    }
}
