//
//  Links.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/19/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Links {
    let reddit: URL?
    let article: URL?
    let wikipedia: URL?
}

extension Links: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        reddit,
        article,
        wikipedia
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.reddit = try values.decodeIfPresent(URL.self, forKey: .reddit)
        self.article = try values.decodeIfPresent(URL.self, forKey: .article)
        self.wikipedia = try values.decodeIfPresent(URL.self, forKey: .wikipedia)
    }
    
}
