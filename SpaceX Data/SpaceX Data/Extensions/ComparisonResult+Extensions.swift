//
//  ComparisonResult+Extensions.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/16/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

extension ComparisonResult {
    var requestParameterValue: String {
        assert(self != .orderedSame, "Comparison result is orderedSame")
        return self == .orderedAscending ? "asc" : "desc"
    }
}
