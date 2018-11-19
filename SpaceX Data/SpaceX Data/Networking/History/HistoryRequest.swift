//
//  HistoryRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/19/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum HistoryFilter: QueryFilter {
    case
    id(Int),
    order(ComparisonResult),
    dateRange((startDate: Date, endDate: Date)),
    flightNumber(Int)
    
    var parameter: String {
        switch self {
        case .id:
            return "id"
        case .order:
            return "order"
        case .dateRange:
            return ""
        case .flightNumber:
            return "flight_number"
        }
    }
    
    var value: Any {
        switch self {
        case .id(let id):
            return id
        case .order(let order):
            return order.requestParameterValue
        case .dateRange:
            return ""
        case .flightNumber(let flightNumber):
            return flightNumber
        }
    }
    
    var queryDictionary: [String : Any] {
        switch self {
        case .dateRange(startDate: let startDate, endDate: let endDate):
            return ["start": DateFormatter.yyyyMMdd.string(from: startDate), "end": DateFormatter.yyyyMMdd.string(from: endDate)]
        default:
            return [parameter: value]
        }
    }
    
}

enum HistoryRequest: Request {
    case
    allMilestones,
    filtered(by: [HistoryFilter])
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "info/history"
    }
    
    var parameters: [String : Any]? {
        if case let .filtered(parameters) = self {
            return parameters.reduce([String: Any](), { (dictionary, filter) -> [String: Any] in
                return dictionary.merging(filter.queryDictionary, uniquingKeysWith: { (first, _) in first })
            })
        }
        
        return nil
    }
    
    
}
