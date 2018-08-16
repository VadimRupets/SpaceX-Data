//
//  LaunchedRocketReusedParts.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchedRocketReusedParts {
    let mainCoreBooster: Bool
    let sideCoreBooster1: Bool
    let sideCoreBooster2: Bool
    let fairings: Bool
    let capsule: Bool
}

extension LaunchedRocketReusedParts: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        mainCoreBooster = "core",
        sideCoreBooster1 = "side_core1",
        sideCoreBooster2 = "side_core2",
        fairings,
        capsule
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.mainCoreBooster = try values.decode(Bool.self, forKey: .mainCoreBooster)
        self.sideCoreBooster1 = try values.decode(Bool.self, forKey: .sideCoreBooster1)
        self.sideCoreBooster2 = try values.decode(Bool.self, forKey: .sideCoreBooster2)
        self.fairings = try values.decode(Bool.self, forKey: .fairings)
        self.capsule = try values.decode(Bool.self, forKey: .capsule)
    }
    
}
