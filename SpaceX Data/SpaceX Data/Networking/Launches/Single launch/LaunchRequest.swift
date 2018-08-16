//
//  LaunchRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/16/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum LaunchRequest: String, Request {
    case
    latest,
    next
    
    var httpMethod: HTTPMethod{
        return .get
    }
    
    var endpoint: String {
        return "launches/".appending(rawValue)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
