//
//  LaunchedPayload.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchedPayload {
    let id: String
    let noradIds: [Int]?
    let reused: Bool?
    let capsuleSerialNumber: String?
    let customers: [String]
    let nationality: String?
    let manufacturer: String?
    let type: String?
    let mass: Mass?
    let orbit: String
    let orbitParameters: OrbitParameters
    let returnedMass: Mass?
    let flightLength: Int?
    let cargoManifest: URL?
}

extension LaunchedPayload: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        id = "payload_id",
        noradIds = "norad_id",
        capsuleSerialNumber = "cap_serial",
        reused,
        customers,
        nationality,
        manufacturer,
        type = "payload_type",
        massInKilograms = "payload_mass_kg",
        massInPounds = "payload_mass_lbs",
        orbit,
        orbitParameters = "orbit_params",
        returnedMassInKilograms = "mass_returned_kg",
        returnedMassInPounds = "mass_returned_lbs",
        flightLength = "flight_time_sec",
        cargoManifest = "cargo_manifest"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.noradIds = try values.decodeIfPresent([Int].self, forKey: .noradIds)
        self.capsuleSerialNumber = try values.decodeIfPresent(String.self, forKey: .capsuleSerialNumber)
        self.reused = try values.decode(Bool.self, forKey: .reused)
        self.customers = try values.decode([String].self, forKey: .customers)
        self.nationality = try values.decodeIfPresent(String.self, forKey: .nationality)
        self.manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
        self.type = try values.decodeIfPresent(String.self, forKey: .type)
        
        if let massInKilograms = try values.decodeIfPresent(Double.self, forKey: .massInKilograms), let massInPounds = try values.decodeIfPresent(Double.self, forKey: .massInPounds) {
            self.mass = Mass(metric: massInKilograms, imperial: massInPounds)
        } else {
            self.mass = nil
        }
        
        self.orbit = try values.decode(String.self, forKey: .orbit)
        self.orbitParameters = try values.decode(OrbitParameters.self, forKey: .orbitParameters)
        
        if let returnedMassInKilograms = try values.decodeIfPresent(Double.self, forKey: .returnedMassInKilograms), let returnedMassInPounds = try values.decodeIfPresent(Double.self, forKey: .returnedMassInPounds) {
            self.returnedMass = Mass(metric: returnedMassInKilograms, imperial: returnedMassInPounds)
        } else {
            self.returnedMass = nil
        }
        
        self.flightLength = try values.decodeIfPresent(Int.self, forKey: .flightLength)
        self.cargoManifest = try values.decodeIfPresent(URL.self, forKey: .cargoManifest)
    }

}
