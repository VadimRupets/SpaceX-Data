//
//  Launchpad.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum LaunchpadStatus: String, Decodable {
    case
    active,
    retired,
    underConstruction = "under construction"
}

struct Launchpad: CustomStringConvertible {
    let id: String
    let name: String
    let status: LaunchpadStatus
    let location: Location
    let launchedVehicles: [String]
    let description: String
}

extension Launchpad: Decodable {
    private enum CodingKeys: String, CodingKey {
        case
        id,
        name = "full_name",
        status,
        location,
        launchedVehicles = "vehicles_launched",
        description = "details"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.status = try values.decode(LaunchpadStatus.self, forKey: .status)
        self.location = try values.decode(Location.self, forKey: .location)
        self.launchedVehicles = try values.decode([String].self, forKey: .launchedVehicles)
        self.description = try values.decode(String.self, forKey: .description)
    }
}

extension Array: TableViewDataRepresentable where Array.Element == Launchpad {
    var tableViewData: [[String : Any]] {
        return map({ tableViewData(with: .subtitle, arguments: $0.name, "Status: \($0.status.rawValue)") })
    }
}
