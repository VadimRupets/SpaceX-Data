//
//  CapsulesDetailsRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum CapsulesDetailsFilter: QueryFilter {
    case
    capsuleSerialNumber(String),
    capsuleID(String),
    status(CapsuleStatus),
    originalLaunchDate(Date),
    missions([String]),
    landings(Int),
    type(CapsuleType)
    
    var parameter: String {
        switch self {
        case .capsuleSerialNumber(_):
            return "capsule_serial"
        case .capsuleID(_):
            return "capsule_id"
        case .status(_):
            return "status"
        case .originalLaunchDate(_):
            return "original_launch"
        case .missions(_):
            return "missions"
        case .landings(_):
            return "landings"
        case .type(_):
            return "type"
        }
    }
    
    var value: Any {
        switch self {
        case .capsuleSerialNumber(let serialNumber):
            return serialNumber
        case .capsuleID(let capsuleID):
            return capsuleID
        case .status(let status):
            return status.rawValue
        case .originalLaunchDate(let originalLaunchDate):
            return DateFormatter.ISO8601.string(from: originalLaunchDate)
        case .missions(let missions):
            return missions
        case .landings(let landings):
            return landings
        case .type(let type):
            return type.rawValue
        }
    }
}

enum CapsulesDetailsRequest: Request {
    case
    all,
    filtered(by: [CapsulesDetailsFilter])
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "parts/caps"
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
