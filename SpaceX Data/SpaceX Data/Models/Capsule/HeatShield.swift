//
//  HeatShield.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/13/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct HeatShield {
    let material: String
    let size: Distance
    let maximumOperatingTemperature: Temperature
    let developmentPartner: String
}

extension HeatShield: Decodable {
    private enum CodingKeys: String, CodingKey {
        case
        material,
        size = "size_meters",
        maximumOperatingTemperature = "temp_degrees",
        developmentPartner = "dev_partner"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.material = try values.decode(String.self, forKey: .material)
        
        let sizeInMeters = try values.decode(Double.self, forKey: .size)
        self.size = Distance(metric: sizeInMeters)
        
        let maximumOperatingTemperatureInCelsius = try values.decode(Double.self, forKey: .maximumOperatingTemperature)
        self.maximumOperatingTemperature = Temperature(metric: maximumOperatingTemperatureInCelsius)
        
        self.developmentPartner = try values.decode(String.self, forKey: .developmentPartner)
    }
}
