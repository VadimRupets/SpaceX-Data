//
//  TableViewDataType.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/4/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum TableViewDataType {
    case
    subtitle,
    rightDisclosure,
    url,
    measurement
    
    var cellIdentifier: String {
        switch self {
        case .subtitle:
            return SubtitleTableViewCell.identifier
        case .rightDisclosure:
            return RightDisclosureTableViewCell.identifier
        case .url:
            return URLTableViewCell.identifier
        case .measurement:
            return MeasurementTableViewCell.identifier
        }
    }
}

enum TableViewDataKeys: String {
    case
    type,
    title,
    subtitle,
    measurement,
    url
}
