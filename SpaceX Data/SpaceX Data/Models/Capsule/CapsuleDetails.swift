//
//  CapsuleDetails.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum CapsuleStatus: String, Decodable {
    case
    active,
    unknown,
    retired,
    destroyed
}

enum CapsuleType: String, Decodable {
    case
    dragon10 = "Dragon 1.0",
    dragon11 = "Dragon 1.1",
    dragon20 = "Dragon 2.0"
}

struct CapsuleDetails: CustomStringConvertible {
    let serialNumber: String
    let id: String
    let status: CapsuleStatus
    let originalLaunchDate: Date?
    let missions: [String]
    let landings: Int
    let type: CapsuleType
    let description: String
}

extension CapsuleDetails: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        serialNumber = "capsule_serial",
        id = "capsule_id",
        status,
        originalLaunchDate = "original_launch",
        missions,
        landings,
        type,
        description = "details"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.serialNumber = try values.decode(String.self, forKey: .serialNumber)
        self.id = try values.decode(String.self, forKey: .id)
        self.status = try values.decode(CapsuleStatus.self, forKey: .status)
        
        if let originalLaunchDateString = try values.decodeIfPresent(String.self, forKey: .originalLaunchDate), let originalLaunchDate = DateFormatter.ISO8601.date(from: originalLaunchDateString) {
            self.originalLaunchDate = originalLaunchDate
        } else {
            originalLaunchDate = nil
        }
        
        self.missions = try values.decode([String].self, forKey: .missions)
        self.landings = try values.decode(Int.self, forKey: .landings)
        self.type = try values.decode(CapsuleType.self, forKey: .type)
        self.description = try values.decodeIfPresent(String.self, forKey: .description) ?? ""
    }
    
}
