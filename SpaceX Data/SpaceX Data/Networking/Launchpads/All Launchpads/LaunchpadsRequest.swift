//
//  LaunchpadsRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum LaunchpadsRequest: Request {
    case allLaunchpads
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "launchpads"
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
