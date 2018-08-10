//
//  Request.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 2/12/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol Request {
    var httpMethod: HTTPMethod { get }
    var endpoint: String { get }
    var parameters: [String: Any]? { get }
}

enum HTTPMethod: String {
    case
    get = "GET",
    post = "POST"
}
