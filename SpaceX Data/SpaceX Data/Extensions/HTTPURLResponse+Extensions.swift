//
//  HTTPURLResponse+Extensions.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/7/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    var shortDescription: String {
        return """
        
        Request response
        URL: \(url?.absoluteString ?? "")
        Status Code: \(statusCode)
        
        """
    }
}
