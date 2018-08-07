//
//  String+Extensions.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/6/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizedFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
