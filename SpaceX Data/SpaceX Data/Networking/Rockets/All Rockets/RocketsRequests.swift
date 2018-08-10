//
//  RocketsRequests.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/7/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum RocketsRequests: Request {
    case
    `default`
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "rockets"
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
