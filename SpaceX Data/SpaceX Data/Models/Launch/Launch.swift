//
//  Launch.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Launch: CustomStringConvertible {
    let flightNumber: Int
    let missionName: String
    let missionIds: [String]
    let launchDate: Date
    let tentative: Bool
    let tentativeMaxPrecision: String
    let rocket: LaunchedRocket
    let ships: [String]
    let telemetry: Telemetry
    let reusedParts: LaunchedRocketReusedParts
    let launchSite: LaunchSite
    let succeed: Bool?
    let launchFailureDetails: LaunchFailureDetails?
    let links: LaunchInfoLinks
    let upcoming: Bool
    let staticFireDate: Date?
    let description: String
}

extension Launch: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        flightNumber = "flight_number",
        missionName = "mission_name",
        missionIds = "mission_id",
        tentative = "is_tentative",
        tentativeMaxPrecision = "tentative_max_precision",
        launchDate = "launch_date_utc",
        rocket,
        ships,
        telemetry,
        reusedParts = "reuse",
        launchSite = "launch_site",
        succeed = "launch_success",
        launchFailureDetails = "launch_failure_details",
        links,
        upcoming,
        staticFireDate = "static_fire_date_utc",
        description = "details"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.flightNumber = try values.decode(Int.self, forKey: .flightNumber)
        self.missionName = try values.decode(String.self, forKey: .missionName)
        self.missionIds = try values.decode([String].self, forKey: .missionIds)
        self.tentative = try values.decode(Bool.self, forKey: .tentative)
        self.tentativeMaxPrecision = try values.decode(String.self, forKey: .tentativeMaxPrecision)
        
        let launchDateString = try values.decode(String.self, forKey: .launchDate)
        guard let launchDate = DateFormatter.ISO8601.date(from: launchDateString) else {
            throw DecodingError.dataCorruptedError(forKey: .launchDate, in: values, debugDescription: "Date string does not match format expected by formatter.")
        }
        self.launchDate = launchDate
        
        self.rocket = try values.decode(LaunchedRocket.self, forKey: .rocket)
        self.ships = try values.decode([String].self, forKey: .ships)
        self.telemetry = try values.decode(Telemetry.self, forKey: .telemetry)
        self.reusedParts = try values.decode(LaunchedRocketReusedParts.self, forKey: .reusedParts)
        self.launchSite = try values.decode(LaunchSite.self, forKey: .launchSite)
        self.succeed = try values.decodeIfPresent(Bool.self, forKey: .succeed)
        self.launchFailureDetails = try values.decodeIfPresent(LaunchFailureDetails.self, forKey: .launchFailureDetails)
        self.links = try values.decode(LaunchInfoLinks.self, forKey: .links)
        self.upcoming = try values.decode(Bool.self, forKey: .upcoming)
        
        if let staticFireDateString = try values.decodeIfPresent(String.self, forKey: .staticFireDate), let staticFireDate = DateFormatter.ISO8601.date(from: staticFireDateString) {
            self.staticFireDate = staticFireDate
        } else {
            self.staticFireDate = nil
        }
        
        self.description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
    }
    
}

// MARK: - TableViewCellDataEssentiallyRepresentable

extension Launch: TableViewCellDataEssentiallyRepresentable {
    
    var essentialData: TableViewCellData {
        return .subtitle((title: missionName, subtitle: DateFormatter.yyyyMMddHHmmss.string(from: launchDate)))
    }
    
}

// MARK: - TableViewCellDataFullyRepresentable

extension Launch: TableViewCellDataFullyRepresentable {
    
    var tableViewData: [TableViewCellData] {
        var tableViewData = [TableViewCellData]()
        
        tableViewData.append(.subtitle((title: "Flight number", subtitle: flightNumber.description)))
        
        if missionIds.count > 0 {
            tableViewData.append(.subtitle((title: "Mission identifiers", subtitle: missionIds.joined(separator: ", "))))
        }
        
        tableViewData.append(.subtitle((title: "Launch date", subtitle: DateFormatter.yyyyMMddHHmmss.string(from: launchDate))))
        
        if tentative {
            tableViewData.append(.subtitle((title: "Is tentative", subtitle: tentative.description)))
            tableViewData.append(.subtitle((title: "Maximum tentative precision ", subtitle: tentativeMaxPrecision)))
        }
        
        tableViewData.append(.rightDisclosure("Launched rocket"))
        
        if ships.count > 0 {
            tableViewData.append(.subtitle((title: "Ships", subtitle: ships.joined(separator: ", "))))
        }
        
        tableViewData.append(contentsOf: telemetry.tableViewData)
        tableViewData.append(contentsOf: reusedParts.tableViewData)
        tableViewData.append(contentsOf: launchSite.tableViewData)
        
        if let succeed = succeed {
            tableViewData.append(.subtitle((title: "Mission outcome", subtitle: succeed ? "Success" : "Failure")))
        }
        
        if let launchFailureDetails = launchFailureDetails {
            tableViewData.append(contentsOf: launchFailureDetails.tableViewData)
        }
        
        tableViewData.append(contentsOf: links.tableViewData)
        tableViewData.append(.subtitle((title: "Is upcoming?", subtitle: upcoming.description)))
        
        if let staticFireDate = staticFireDate {
            tableViewData.append(.subtitle((title: "Static fire date", subtitle: DateFormatter.yyyyMMddHHmmss.string(from: staticFireDate))))
        }
        
        if description.count > 0 {
            tableViewData.append(.subtitle((title: "Brief summary", subtitle: description)))
        }
        
        return tableViewData
    }
    
}
