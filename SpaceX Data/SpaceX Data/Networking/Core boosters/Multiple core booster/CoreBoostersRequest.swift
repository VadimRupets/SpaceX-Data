//
//  CoreBoostersRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum CoreBoostersFilter: QueryFilter {
    case
    serialNumber(String),
    block(Int),
    status(CoreBoosterStatus),
    originalLaunchDate(Date),
    missions([String]),
    rtlsAttempt(Bool),
    rtlsLandings(Int),
    asdsAttempt(Bool),
    asdsLandings(Int),
    waterLanding(Bool)
    
    internal var parameter: String {
        switch self {
        case .serialNumber(_):
            return "core_serial"
        case .block(_):
            return "block"
        case .status(_):
            return "status"
        case .originalLaunchDate(_):
            return "original_launch"
        case .missions(_):
            return "missions"
        case .rtlsAttempt(_):
            return "rtls_attempt"
        case .rtlsLandings(_):
            return "rtls_landings"
        case .asdsAttempt(_):
            return "asds_attempt"
        case .asdsLandings(_):
            return "asds_landings"
        case .waterLanding(_):
            return "water_landing"
        }
    }
    
    internal var value: Any {
        switch self {
        case .serialNumber(let serialNumber):
            return serialNumber
        case .block(let block):
            return block
        case .status(let status):
            return status.rawValue
        case .originalLaunchDate(let launchDate):
            return DateFormatter.ISO8601.string(from: launchDate)
        case .missions(let missions):
            return missions
        case .rtlsAttempt(let rtlsAttempt):
            return rtlsAttempt
        case .rtlsLandings(let rtlsLandings):
            return rtlsLandings
        case .asdsAttempt(let asdsAttempt):
            return asdsAttempt
        case .asdsLandings(let asdsLandings):
            return asdsLandings
        case .waterLanding(let waterLanding):
            return waterLanding
        }
    }
}

enum CoreBoostersRequest: Request {
    case
    all,
    filtered(by: [CoreBoostersFilter])
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "parts/cores"
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
