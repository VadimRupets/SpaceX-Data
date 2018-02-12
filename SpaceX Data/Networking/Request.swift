//
//  Request.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 2/12/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol RequestProtocol {
    
    var httpMethod: HTTPMethod { get }
    var endpoint: Endpoint { get }
    
}

final class Request: RequestProtocol {
    
    var httpMethod: HTTPMethod
    var endpoint: Endpoint
    
    init(endpoint: Endpoint, httpMethod: HTTPMethod) {
        self.endpoint = endpoint
        self.httpMethod = httpMethod
    }
    
}
