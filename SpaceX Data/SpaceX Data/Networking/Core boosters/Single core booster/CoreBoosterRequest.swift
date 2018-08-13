//
//  CoreBoosterRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct CoreBoosterRequest: DetailedItemRequest {
    internal let itemID: String
    
    init(coreSerialNumber: String) {
        itemID = coreSerialNumber
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "parts/cores/".appending(itemID)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
