//
//  TableViewData.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/25/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum TableViewCellData {
    case
    subtitle((title: String, subtitle: String)),
    rightDisclosure(String),
    url((title: String, url: URL)),
    measurement((title: String, measurement: Measurement))
    
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
