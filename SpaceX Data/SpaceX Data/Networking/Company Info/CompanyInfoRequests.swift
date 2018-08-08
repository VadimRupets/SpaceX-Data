//
//  CompanyInfoRequests.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 5/17/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

public enum CompanyInfoRequests: Request {
    case `default`
    
    public var httpMethod: HTTPMethod {
        return .get
    }
    
    public var endpoint: String {
        return "info"
    }
    
    public var parameters: [String : Any]? {
        return nil
    }
}
