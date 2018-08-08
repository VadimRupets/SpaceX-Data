//
//  DateFormatter+Extensions.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/7/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var yyyyMMdd: DateFormatter {
        return createDateFormatter(with: "yyyy-MM-dd")
    }
    
    static var ISO8601: DateFormatter {
        return createDateFormatter(with: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    }
    
    private static func createDateFormatter(with dateFormat: String, locale: Locale = Locale(identifier: "en_US_POSIX")) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = locale
        
        return dateFormatter
    }
}
