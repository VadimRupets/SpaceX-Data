//
//  RoadsterInfo.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/8/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct RoadsterInfo: CustomStringConvertible {
    let name: String
    let launchDate: Date
    let launchMass: Mass
    let noradId: Int
    let epochInJulianDays: Double
    let orbitType: String
    let apoapsis: Double
    let periapsis: Double
    let semiMajorAxis: Double
    let eccentricity: Double
    let inclination: Double
    let longitude: Double
    let periapsisArgument: Double
    let orbitalPeriodInDays: Float
    let speed: Speed
    let distanceFromEarth: Distance
    let distanceFromMars: Distance
    let wikipediaURL: URL
    let description: String
}

extension RoadsterInfo: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        name,
        launchDateUTC = "launch_date_utc",
        launchMassInKilograms = "launch_mass_kg",
        launchMassInPounds = "launch_mass_lbs",
        noradId = "norad_id",
        epochInJulianDays = "epoch_jd",
        orbitType = "orbit_type",
        apoapsis = "apoapsis_au",
        periapsis = "periapsis_au",
        semiMajorAxis = "semi_major_axis_au",
        eccentricity,
        inclination,
        longitude,
        periapsisArgument = "periapsis_arg",
        orbitalPeriodInDays = "period_days",
        speedInKph = "speed_kph",
        speedInMph = "speed_mph",
        distanceFromEarthInKilometers = "earth_distance_km",
        distanceFromEarthInMiles = "earth_distance_mi",
        distanceFromMarsInKilometers = "mars_distance_km",
        distanceFromMarsInMiles = "mars_distance_mi",
        wikipediaURL = "wikipedia",
        description = "details"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try values.decode(String.self, forKey: .name)
        
        let launchDateString = try values.decode(String.self, forKey: .launchDateUTC)
        guard let launchDate = DateFormatter.ISO8601.date(from: launchDateString) else {
            throw DecodingError.dataCorruptedError(forKey: .launchDateUTC, in: values, debugDescription: "Date string does not match format expected by formatter.")
        }
        self.launchDate = launchDate
        
        let launchMassInKilograms = try values.decode(Double.self, forKey: .launchMassInKilograms)
        let launchMassInPounds = try values.decode(Double.self, forKey: .launchMassInPounds)
        self.launchMass = Mass(metric: launchMassInKilograms, imperial: launchMassInPounds)
        self.noradId = try values.decode(Int.self, forKey: .noradId)
        self.epochInJulianDays = try values.decode(Double.self, forKey: .epochInJulianDays)
        self.orbitType = try values.decode(String.self, forKey: .orbitType)
        self.apoapsis = try values.decode(Double.self, forKey: .apoapsis)
        self.periapsis = try values.decode(Double.self, forKey: .periapsis)
        self.semiMajorAxis = try values.decode(Double.self, forKey: .semiMajorAxis)
        self.eccentricity = try values.decode(Double.self, forKey: .eccentricity)
        self.inclination = try values.decode(Double.self, forKey: .inclination)
        self.longitude = try values.decode(Double.self, forKey: .longitude)
        self.periapsisArgument = try values.decode(Double.self, forKey: .periapsisArgument)
        self.orbitalPeriodInDays = try values.decode(Float.self, forKey: .orbitalPeriodInDays)
        
        let speedInKph = try values.decode(Double.self, forKey: .speedInKph)
        let speedInMph = try values.decode(Double.self, forKey: .speedInMph)
        self.speed = Speed(metric: speedInKph, imperial: speedInMph)
        
        let distanceFromEarthInKilometers = try values.decode(Double.self, forKey: .distanceFromEarthInKilometers)
        let distanceFromEarthInMiles = try values.decode(Double.self, forKey: .distanceFromEarthInMiles)
        self.distanceFromEarth = Distance(metric: distanceFromEarthInKilometers * 1000, imperial: distanceFromEarthInMiles * 5280)
        
        let distanceFromMarsInKilometers = try values.decode(Double.self, forKey: .distanceFromMarsInKilometers)
        let distanceFromMarsInMiles = try values.decode(Double.self, forKey: .distanceFromMarsInMiles)
        self.distanceFromMars = Distance(metric: distanceFromMarsInKilometers * 1000, imperial: distanceFromMarsInMiles * 5280)
        
        self.wikipediaURL = try values.decode(URL.self, forKey: .wikipediaURL)
        self.description = try values.decode(String.self, forKey: .description)
    }
    
}

extension RoadsterInfo: TableViewDataFullyRepresentable {
    var tableViewData: [TableViewCellData] {
        var tableViewData: [TableViewCellData] = []
        
        tableViewData.append(.subtitle((title: "Launch date", subtitle: DateFormatter.yyyyMMddHHmmss.string(from: launchDate))))
        tableViewData.append(.measurement((title: "Launch mass", measurement: launchMass)))
        tableViewData.append(.subtitle((title: "NORAD id", subtitle: noradId.description)))
        tableViewData.append(.subtitle((title: "Epoch in Julian days", subtitle: epochInJulianDays.description)))
        tableViewData.append(.subtitle((title: "Orbit type", subtitle: orbitType.capitalized)))
        tableViewData.append(.subtitle((title: "Apoapsis", subtitle: apoapsis.description)))
        tableViewData.append(.subtitle((title: "Periapsis", subtitle: periapsis.description)))
        tableViewData.append(.subtitle((title: "Semi-major axis", subtitle: semiMajorAxis.description)))
        tableViewData.append(.subtitle((title: "Eccentricity", subtitle: eccentricity.description)))
        tableViewData.append(.subtitle((title: "Inclination", subtitle: inclination.description)))
        tableViewData.append(.subtitle((title: "Longitude", subtitle: longitude.description)))
        tableViewData.append(.subtitle((title: "Argument of periapsis", subtitle: periapsisArgument.description)))
        tableViewData.append(.subtitle((title: "Period", subtitle: orbitalPeriodInDays.description)))
        tableViewData.append(.measurement((title: "Speed", measurement: speed)))
        tableViewData.append(.measurement((title: "Distance from Earth", measurement: distanceFromEarth)))
        tableViewData.append(.measurement((title: "Distance from Mars", measurement: distanceFromMars)))
        tableViewData.append(.url((title: "Wikipedia link", url: wikipediaURL)))
        
        return tableViewData
    }
}
