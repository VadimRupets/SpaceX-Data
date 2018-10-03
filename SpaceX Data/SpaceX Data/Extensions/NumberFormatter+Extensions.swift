//
//  NumberFormatter+Extensions.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/2/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

extension NumberFormatter {
    
    static var dollarFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.currencyCode = "USD"
        numberFormatter.currencySymbol = "$"
        numberFormatter.numberStyle = .currencyAccounting
        
        return numberFormatter
    }
    
}
