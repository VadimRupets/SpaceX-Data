//
//  Capsule.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/13/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Capsule: CustomStringConvertible {
    let id: String
    let name: String
    let type: String
    let active: Bool
    let crewCapacity: Int
    let sidewallAngleDegree: Int
    let orbitDurationInYears: Int
    let heatShield: HeatShield
    let thrusters: [Thruster]
    let launchPayloadMass: Mass
    let launchPayloadVolume: Volume
    let returnPayloadMass: Mass
    let returnPayloadVolume: Volume
    let pressurizedCapsulePayloadVolume: Volume
    let trunk: Trunk
    let heightWithTrunk: Distance
    let diameter: Distance
    let wikipediaURL: URL
    let description: String
}

extension Capsule: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        id,
        name,
        type,
        active,
        crewCapacity = "crew_capacity",
        sidewallAngleDegree = "sidewall_angle_deg",
        orbitDurationInYears = "orbit_duration_yr",
        heatShield = "heat_shield",
        thrusters,
        launchPayloadMass = "launch_payload_mass",
        launchPayloadVolume = "launch_payload_vol",
        returnPayloadMass = "return_payload_mass",
        returnPayloadVolume = "return_payload_vol",
        pressurizedCapsule = "pressurized_capsule",
        trunk,
        heigthWithTrunk = "height_w_trunk",
        diameter,
        wikipediaURL = "wikipedia",
        description
    }
    
    private enum PressurizedCapsuleCodingKeys: String, CodingKey {
        case payloadVolume = "payload_volume"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.type = try values.decode(String.self, forKey: .type)
        self.active = try values.decode(Bool.self, forKey: .active)
        self.crewCapacity = try values.decode(Int.self, forKey: .crewCapacity)
        self.sidewallAngleDegree = try values.decode(Int.self, forKey: .sidewallAngleDegree)
        self.orbitDurationInYears = try values.decode(Int.self, forKey: .orbitDurationInYears)
        self.heatShield = try values.decode(HeatShield.self, forKey: .heatShield)
        self.thrusters = try values.decode([Thruster].self, forKey: .thrusters)
        self.launchPayloadMass = try values.decode(Mass.self, forKey: .launchPayloadMass)
        self.launchPayloadVolume = try values.decode(Volume.self, forKey: .launchPayloadVolume)
        self.returnPayloadMass = try values.decode(Mass.self, forKey: .returnPayloadMass)
        self.returnPayloadVolume = try values.decode(Volume.self, forKey: .returnPayloadVolume)
        
        let pressurizedCapsuleVolumeValue = try values.nestedContainer(keyedBy: PressurizedCapsuleCodingKeys.self, forKey: .pressurizedCapsule)
        self.pressurizedCapsulePayloadVolume = try pressurizedCapsuleVolumeValue.decode(Volume.self, forKey: .payloadVolume)
        
        self.trunk = try values.decode(Trunk.self, forKey: .trunk)
        self.heightWithTrunk = try values.decode(Distance.self, forKey: .heigthWithTrunk)
        self.diameter = try values.decode(Distance.self, forKey: .diameter)
        self.wikipediaURL = try values.decode(URL.self, forKey: .wikipediaURL)
        self.description = try values.decode(String.self, forKey: .description)
    }
    
}
