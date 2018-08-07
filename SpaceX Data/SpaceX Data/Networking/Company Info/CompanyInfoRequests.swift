//
//  CompanyInfoRequests.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 5/17/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

public enum CompanyInfoRequests: Request {
    case companyInfo
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .companyInfo:
            return .get
        }
    }
    
    public var endpoint: String {
        switch self {
        case .companyInfo:
            return "info"
        }
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .companyInfo:
            return nil
        }
    }
}
