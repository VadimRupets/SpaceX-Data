//
//  Rocket.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/24/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Rocket {
    let id: String
    let name: String
    let type: String
    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLauch: Int
    let successRatePercent: Float
    let firstFlight: Date
    let country: String
    let company: String
    let height: Distance
    let diameter: Distance
    let mass: Mass
    let payloadWeights: [PayloadWeight]
    let firstStage: RocketFirstStage
    let secondStage: RocketSecondStage
    let engines: Engines
    let landingLegs: LandingLegs
    private let _description: String
}

extension Rocket: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        id,
        name,
        type,
        active,
        stages,
        boosters,
        costPerLaunch = "cost_per_launch",
        successRatePercent = "success_rate_pct",
        firstFlight = "first_flight",
        country,
        company,
        height,
        diameter,
        mass,
        payloadWeights = "payload_weights",
        firstStage = "first_stage",
        secondStage = "second_stage",
        engines,
        landingLegs = "landing_legs",
        description
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.type = try values.decode(String.self, forKey: .type)
        self.active = try values.decode(Bool.self, forKey: .active)
        self.stages = try values.decode(Int.self, forKey: .stages)
        self.boosters = try values.decode(Int.self, forKey: .boosters)
        self.costPerLauch = try values.decode(Int.self, forKey: .costPerLaunch)
        self.successRatePercent = try values.decode(Float.self, forKey: .successRatePercent)
        
        let firstFlight = try values.decode(String.self, forKey: .firstFlight)
        guard let firstFlightDate = DateFormatter.yyyyMMdd.date(from: firstFlight) else {
            throw NetworkError.noData
        }
        
        self.firstFlight = firstFlightDate
        
        self.country = try values.decode(String.self, forKey: .country)
        self.company = try values.decode(String.self, forKey: .company)
        self.height = try values.decode(Distance.self, forKey: .height)
        self.diameter = try values.decode(Distance.self, forKey: .diameter)
        self.mass = try values.decode(Mass.self, forKey: .mass)
        self.payloadWeights = try values.decode([PayloadWeight].self, forKey: .payloadWeights)
        self.firstStage = try values.decode(RocketFirstStage.self, forKey: .firstStage)
        self.secondStage = try values.decode(RocketSecondStage.self, forKey: .secondStage)
        self.engines = try values.decode(Engines.self, forKey: .engines)
        self.landingLegs = try values.decode(LandingLegs.self, forKey: .landingLegs)
        self._description = try values.decode(String.self, forKey: .description)
    }
    
}

extension Rocket: CustomStringConvertible {
    var description: String {
        return _description
    }
}
