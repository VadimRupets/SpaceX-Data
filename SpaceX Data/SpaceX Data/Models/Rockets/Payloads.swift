//
//  Payloads.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct Payloads {
    let compositeFairing: CompositeFairing
    let options: [String]
}

extension Payloads: Decodable {
    private enum CodingKeys: String, CodingKey {
        case
        compositeFairing = "composite_fairing",
        option1 = "option_1",
        option2 = "option_2",
        option3 = "option_3"
        
        static var options: [CodingKeys] {
            return [.option1, .option2, .option3]
        }
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.compositeFairing = try values.decode(CompositeFairing.self, forKey: .compositeFairing)
        
        var options = [String]()
        for option in CodingKeys.options {
            guard
                let wrappedOption = try? values.decodeIfPresent(String.self, forKey: option),
                let unwrappedOption = wrappedOption else {
                continue
            }
            
            options.append(unwrappedOption.capitalizingFirstLetter())
        }
        
        self.options = options
    }
}
