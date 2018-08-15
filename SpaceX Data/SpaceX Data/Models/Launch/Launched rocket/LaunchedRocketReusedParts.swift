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
    let firstSideCoreBooster: Bool
    let secondSideCoreBooster: Bool
    let fairings: Bool
    let capsule: Bool
}

extension LaunchedRocketReusedParts: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        mainCoreBooster = "core",
        firstSideCoreBooster = "side_core1",
        secondSideCoreBooster = "side_core2",
        fairings,
        capsule
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.mainCoreBooster = try values.decode(Bool.self, forKey: .mainCoreBooster)
        self.firstSideCoreBooster = try values.decode(Bool.self, forKey: .firstSideCoreBooster)
        self.secondSideCoreBooster = try values.decode(Bool.self, forKey: .secondSideCoreBooster)
        self.fairings = try values.decode(Bool.self, forKey: .fairings)
        self.capsule = try values.decode(Bool.self, forKey: .capsule)
    }
    
}
