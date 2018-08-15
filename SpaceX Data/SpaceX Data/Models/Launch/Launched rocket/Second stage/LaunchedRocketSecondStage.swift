//
//  LaunchedRocketSecondStage.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchedRocketSecondStage {
    let block: Int?
    let payloads: [LaunchedPayload]
}

extension LaunchedRocketSecondStage: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        block,
        payloads
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.block = try values.decodeIfPresent(Int.self, forKey: .block)
        self.payloads = try values.decode([LaunchedPayload].self, forKey: .payloads)
    }
    
}
