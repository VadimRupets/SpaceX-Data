//
//  HTTPURLResponse+Extensions.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/7/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    fileprivate var shortDescription: String {
        return """
        
        Request response
        URL: \(url?.absoluteString ?? "")
        Status Code: \(statusCode)
        """
    }
    
    func printDescription(with error: Error) {
        print(shortDescription)
        print("Error: \(error.localizedDescription)")
    }
    
    func printDescription(with json: Any) {
        print(shortDescription)
        print("JSON")
        print(json)
    }
}
