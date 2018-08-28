//
//  CapsuleRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct CapsuleRequest: DetailedItemRequest {
    internal let itemId: String
    
    init(capsuleId: String) {
        self.itemId = capsuleId
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "capsules/".appending(itemId)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
