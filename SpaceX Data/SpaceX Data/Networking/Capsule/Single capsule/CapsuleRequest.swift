//
//  CapsuleRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct CapsuleRequest: DetailedItemRequest {
    internal let itemID: String
    
    init(capsuleID: String) {
        self.itemID = capsuleID
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "capsules/".appending(itemID)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
