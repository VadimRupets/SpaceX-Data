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
    let launchDate: Date
    let rocket: LaunchedRocket
    let telemetry: Telemetry
    let reusedParts: LaunchedRocketReusedParts
    let launchSite: LaunchSite
    let succeed: Bool?
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
        launchDate = "launch_date_utc",
        rocket,
        telemetry,
        reusedParts = "reuse",
        launchSite = "launch_site",
        succeed = "launch_success",
        links,
        upcoming,
        staticFireDate = "static_fire_date_utc",
        description = "details"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.flightNumber = try values.decode(Int.self, forKey: .flightNumber)
        self.missionName = try values.decode(String.self, forKey: .missionName)
        
        let launchDateString = try values.decode(String.self, forKey: .launchDate)
        guard let launchDate = DateFormatter.ISO8601.date(from: launchDateString) else {
            throw DecodingError.dataCorruptedError(forKey: .launchDate, in: values, debugDescription: "Date string does not match format expected by formatter.")
        }
        self.launchDate = launchDate
        
        self.rocket = try values.decode(LaunchedRocket.self, forKey: .rocket)
        self.telemetry = try values.decode(Telemetry.self, forKey: .telemetry)
        self.reusedParts = try values.decode(LaunchedRocketReusedParts.self, forKey: .reusedParts)
        self.launchSite = try values.decode(LaunchSite.self, forKey: .launchSite)
        self.succeed = try values.decodeIfPresent(Bool.self, forKey: .succeed)
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
