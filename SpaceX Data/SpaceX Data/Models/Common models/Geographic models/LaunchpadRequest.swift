//
//  LaunchpadRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchpadRequest: DetailedItemRequest {
    internal let itemId: String
    
    init(launchpadId: String) {
        itemId = launchpadId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "launchpads/".appending(itemId)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
}
