//
//  RocketRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/24/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct RocketRequest: DetailedItemRequest {
    internal let itemId: String
    
    init(rocketId: String) {
        itemId = rocketId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "rockets/".appending(itemId)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
