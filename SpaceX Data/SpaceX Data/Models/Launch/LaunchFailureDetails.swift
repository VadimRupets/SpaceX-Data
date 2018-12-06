//
//  LaunchFailureDetails.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/22/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchFailureDetails {
    let time: Int
    let altitude: Int?
    let reason: String
}

extension LaunchFailureDetails: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        time,
        altitude,
        reason
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.time = try values.decode(Int.self, forKey: .time)
        self.altitude = try values.decodeIfPresent(Int.self, forKey: .altitude)
        self.reason = try values.decode(String.self, forKey: .reason)
    }
    
}

// MARK: - TableViewCellDataFullyRepresentable

extension LaunchFailureDetails: TableViewCellDataFullyRepresentable {
    
    var tableViewData: [TableViewCellData] {
        return [TableViewCellData.subtitle((title: "Launch failure", subtitle: reason))]
    }
    
}
