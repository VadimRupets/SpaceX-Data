//
//  CompanyInfoRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 5/17/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum CompanyInfoRequest: Request {
    case companyInfo
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "info"
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
