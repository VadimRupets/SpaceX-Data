//
//  OrbitParameters.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct OrbitParameters {
    let referenceSystem: String
    let regime: String?
    let longitude: Double?
    let semiMajorAxis: Distance?
    let eccentricity: Double?
    let periapsis: Distance?
    let apoapsis: Distance?
    let inclinationDegree: Double?
    let periodInMinutes: Double?
    let lifespanInYears: Int?
    let epoch: Date?
    let meanMotion: Double?
    let raan: Double?
}

extension OrbitParameters: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        referenceSystem = "reference_system",
        regime,
        longitude,
        semiMajorAxisInKilometers = "semi_major_axis_km",
        eccentricity,
        periapsisInKilometers = "periapsis_km",
        apoapsisInKilometers = "apoapsis_km",
        inclinationDegree = "inclination_deg",
        periodInMinutes = "period_min",
        lifespanInYears = "lifespan_years",
        epoch,
        meanMotion = "mean_motion",
        raan
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.referenceSystem = try values.decode(String.self, forKey: .referenceSystem)
        self.regime = try values.decodeIfPresent(String.self, forKey: .regime)
        self.longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        
        if let semiMajorAxisInKilometers = try values.decodeIfPresent(Double.self, forKey: .semiMajorAxisInKilometers) {
            self.semiMajorAxis = Distance(metric: semiMajorAxisInKilometers * 1000)
        } else {
            self.semiMajorAxis = nil
        }
        
        self.eccentricity = try values.decodeIfPresent(Double.self, forKey: .eccentricity)
        
        if let periapsisInKilometers = try values.decodeIfPresent(Double.self, forKey: .periapsisInKilometers) {
            self.periapsis = Distance(metric: periapsisInKilometers * 1000)
        } else {
            self.periapsis = nil
        }
        
        if let apoapsisInKilometers = try values.decodeIfPresent(Double.self, forKey: .apoapsisInKilometers) {
            self.apoapsis = Distance(metric: apoapsisInKilometers * 1000)
        } else {
            self.apoapsis = nil
        }
        
        self.inclinationDegree = try values.decodeIfPresent(Double.self, forKey: .inclinationDegree)
        self.periodInMinutes = try values.decodeIfPresent(Double.self, forKey: .periodInMinutes)
        self.lifespanInYears = try values.decodeIfPresent(Int.self, forKey: .lifespanInYears)
        
        if let epochDateString = try values.decodeIfPresent(String.self, forKey: .epoch), let epoch = DateFormatter.ISO8601.date(from: epochDateString) {
            self.epoch = epoch
        } else {
            self.epoch = nil
        }
        
        self.meanMotion = try values.decodeIfPresent(Double.self, forKey: .meanMotion)
        self.raan = try values.decodeIfPresent(Double.self, forKey: .raan)
    }
    
}

