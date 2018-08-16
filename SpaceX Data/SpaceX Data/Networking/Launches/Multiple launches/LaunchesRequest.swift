//
//  LaunchesRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum Order: String {
    case
    ascending,
    descending
}

enum LaunchesFilter: QueryFilter {
    case
    ordered(ComparisonResult),
    dateRange((startDate: Date, endDate: Date)),
    flightNumber(Int),
    launchYear(Int),
    launchDate(Date),
    rocketID(String),
    rocketName(String),
    rocketType(String),
    coreBoosterSerialNumber(String),
    capsuleSerialNumber(String),
    numberOfPreviousCoreBoosterFlights(Int),
    coreBoosterBlockNumber(Int),
    mainCoreBoosterReused(Bool),
    sideCoreBooster1Reused(Bool),
    sideCoreBooster2Reused(Bool),
    fairingsReused(Bool),
    capsuleReused(Bool),
    launchSiteID(String),
    launchSiteName(String),
    launchSiteLongName(String),
    payloadID(String),
    noradID(Int),
    customer(String),
    nationality(String),
    manufacturer(String),
    payloadType(String),
    orbit(String),
    succeedLaunch(Bool),
    reusedCores(Bool),
    landed(Bool),
    landingType(LandingType),
    landingVehicle(String)
    
    var parameter: String {
        switch self {
        case .ordered(_):
            return "order"
        case .dateRange(startDate: _, endDate: _):
            return ""
        case .flightNumber(_):
            return "flight_number"
        case .launchYear(_):
            return "launch_year"
        case .launchDate(_):
            return "launch_date_utc"
        case .rocketID(_):
            return "rocket_id"
        case .rocketName(_):
            return "rocket_name"
        case .rocketType(_):
            return "rocket_type"
        case .coreBoosterSerialNumber(_):
            return "core_serial"
        case .capsuleSerialNumber(_):
            return "core_serial"
        case .numberOfPreviousCoreBoosterFlights(_):
            return "core_flight"
        case .coreBoosterBlockNumber(_):
            return "block"
        case .mainCoreBoosterReused(_):
            return "core_reused"
        case .sideCoreBooster1Reused(_):
            return "side_core1_reuse"
        case .sideCoreBooster2Reused(_):
            return "side_core2_reuse"
        case .fairingsReused(_):
            return "fairings_reuse"
        case .capsuleReused(_):
            return "capsule_reuse"
        case .launchSiteID(_):
            return "site_id"
        case .launchSiteName(_):
            return "site_name"
        case .launchSiteLongName(_):
            return "site_name_long"
        case .payloadID(_):
            return "payload_id"
        case .noradID(_):
            return "norad_id"
        case .customer(_):
            return "customer"
        case .nationality(_):
            return "nationality"
        case .manufacturer(_):
            return "manufacturer"
        case .payloadType(_):
            return "payload_type"
        case .orbit(_):
            return "orbit"
        case .succeedLaunch(_):
            return "launch_success"
        case .reusedCores(_):
            return "reused"
        case .landed(_):
            return "land_success"
        case .landingType(_):
            return "landing_type"
        case .landingVehicle(_):
            return "landing_vehicle"
        }
    }
    
    var value: Any {
        switch self {
        case .ordered(let order):
            return order.requestParameterValue
        case .dateRange(startDate: _, endDate: _):
            return ""
        case .flightNumber(let flightNumber):
            return flightNumber
        case .launchYear(let launchYear):
            return launchYear
        case .launchDate(let launchDate):
            return DateFormatter.ISO8601.string(from: launchDate)
        case .rocketID(let rocketID):
            return rocketID
        case .rocketName(let rocketName):
            return rocketName
        case .rocketType(let rocketType):
            return rocketType
        case .coreBoosterSerialNumber(let coreBoosterSerialNumber):
            return coreBoosterSerialNumber
        case .capsuleSerialNumber(let capsuleSerialNumber):
            return capsuleSerialNumber
        case .numberOfPreviousCoreBoosterFlights(let numberOfPreviousFlights):
            return numberOfPreviousFlights
        case .coreBoosterBlockNumber(let blockNumber):
            return blockNumber
        case .mainCoreBoosterReused(let mainCoreBoosterReused):
            return mainCoreBoosterReused
        case .sideCoreBooster1Reused(let sideCoreBooster1Reused):
            return sideCoreBooster1Reused
        case .sideCoreBooster2Reused(let sideCoreBooster2Reused):
            return sideCoreBooster2Reused
        case .fairingsReused(let fairingsReused):
            return fairingsReused
        case .capsuleReused(let capsuleReused):
            return capsuleReused
        case .launchSiteID(let launchSiteID):
            return launchSiteID
        case .launchSiteName(let launchSiteName):
            return launchSiteName
        case .launchSiteLongName(let launchSiteLongName):
            return launchSiteLongName
        case .payloadID(let payloadID):
            return payloadID
        case .noradID(let noradID):
            return noradID
        case .customer(let customer):
            return customer
        case .nationality(let nationality):
            return nationality
        case .manufacturer(let manufacturer):
            return manufacturer
        case .payloadType(let payloadType):
            return payloadType
        case .orbit(let orbit):
            return orbit
        case .succeedLaunch(let succeedLaunch):
            return succeedLaunch
        case .reusedCores(let reusedCores):
            return reusedCores
        case .landed(let landed):
            return landed
        case .landingType(let landingType):
            return landingType.rawValue
        case .landingVehicle(let landingVehicle):
            return landingVehicle
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

enum LaunchesRequest: Request {
    case
    past,
    upcoming,
    all,
    filtered(by: [LaunchesFilter])
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        let endpoint = "launches"
        switch self {
        case .past:
            return endpoint
        case .upcoming:
            return endpoint.appending("/upcoming")
        case .all:
            return endpoint.appending("/all")
        case .filtered(by: _):
            return endpoint
        }
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
