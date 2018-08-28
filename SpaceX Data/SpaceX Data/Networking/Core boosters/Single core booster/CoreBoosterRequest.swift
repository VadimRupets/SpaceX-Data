//
//  CoreBoosterRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct CoreBoosterRequest: DetailedItemRequest {
    internal let itemId: String
    
    init(coreSerialNumber: String) {
        itemId = coreSerialNumber
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "parts/cores/".appending(itemId)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
