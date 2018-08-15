//
//  LaunchedRocketFirstStage.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchedRocketFirstStage {
    let coreBoosters: [LaunchedRocketFirstStageCoreBooster]
}

extension LaunchedRocketFirstStage: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case coreBoosters = "cores"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.coreBoosters = try values.decode([LaunchedRocketFirstStageCoreBooster].self, forKey: .coreBoosters)
    }
    
}
