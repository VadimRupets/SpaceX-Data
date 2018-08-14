//
//  CapsuleDetailsRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct CapsuleDetailsRequest: DetailedItemRequest {
    internal let itemID: String
    
    init(capsuleSerialNumber: String) {
        self.itemID = capsuleSerialNumber
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "parts/caps/".appending(itemID)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
