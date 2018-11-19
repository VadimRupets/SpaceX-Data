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
        return dateFormatter(with: "yyyy-MM-dd")
    }
    
    static var ISO8601: DateFormatter {
        return dateFormatter(with: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    }
    
    static var ISO8601Millisecondless: DateFormatter {
        return dateFormatter(with: "yyyy-MM-dd'T'HH:mm:ss'Z'")
    }
    
    static var yyyyMMddHHmmss: DateFormatter {
        return dateFormatter(with: "yyyy-MM-dd HH:mm:ss")
    }
    
    private static func dateFormatter(with dateFormat: String, locale: Locale = Locale(identifier: "en_US_POSIX")) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = locale
        
        return dateFormatter
    }
}
