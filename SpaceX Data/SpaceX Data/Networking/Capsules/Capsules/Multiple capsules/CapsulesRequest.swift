//
//  CapsulesRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum CapsulesRequest: Request {
    case `default`
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "capsules"
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
