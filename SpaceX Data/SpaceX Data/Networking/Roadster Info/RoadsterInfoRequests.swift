//
//  RoadsterInfoRequests.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/8/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum RoadsterInfoRequests: Request {
    case `default`
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "info/roadster"
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
