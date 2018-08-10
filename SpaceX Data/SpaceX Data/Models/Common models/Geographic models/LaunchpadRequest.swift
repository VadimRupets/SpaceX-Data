//
//  LaunchpadRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchpadRequest: DetailedItemRequest {
    internal let itemID: String
    
    init(launchpadID: String) {
        itemID = launchpadID
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "launchpads/".appending(itemID)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
}
