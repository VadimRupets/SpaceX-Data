//
//  MockRequest.swift
//  SpaceX DataTests
//
//  Created by Vadim Rupets on 8/16/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation
@testable import SpaceX_Data

struct MockRequest: Request {
    let httpMethod: HTTPMethod
    let endpoint: String
    let parameters: [String : Any]?
    
    init(httpMethod: HTTPMethod = .get, endpoint: String = "", parameters: [String: Any]? = nil) {
        self.httpMethod = httpMethod
        self.endpoint = endpoint
        self.parameters = parameters
    }
}
