//
//  LaunchesRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum LaunchesRequest: Request {
    case
    past,
    upcoming,
    all
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        let endpoint = "launches"
        switch self {
        case .past:
            return endpoint.appending("/past")
        case .upcoming:
            return endpoint.appending("/upcoming")
        case .all:
            return endpoint.appending("/all")
        }
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
