//
//  LaunchedRocket.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchedRocket {
    let id: String
    let name: String
    let type: String
    let firstStage: LaunchedRocketFirstStage
    let secondStage: LaunchedRocketSecondStage
    let fairings: Fairings
}

extension LaunchedRocket: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        id = "rocket_id",
        name = "rocket_name",
        type = "rocket_type",
        firstStage = "first_stage",
        secondStage = "second_stage",
        fairings
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.type = try values.decode(String.self, forKey: .type)
        self.firstStage = try values.decode(LaunchedRocketFirstStage.self, forKey: .firstStage)
        self.secondStage = try values.decode(LaunchedRocketSecondStage.self, forKey: .secondStage)
        self.fairings = try values.decode(Fairings.self, forKey: .fairings)
    }
    
}
