//
//  QueryFilter.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/13/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol QueryFilter {
    var parameter: String { get }
    var value: Any { get }
}

extension QueryFilter {
    var queryDictionary: [String: Any] {
        return [parameter: value]
    }
}
