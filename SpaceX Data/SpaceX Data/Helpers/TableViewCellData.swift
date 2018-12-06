//
//  TableViewCellData.swift
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
    measurement((title: String, measurement: Measurement)),
    expandable((title: String, details: [TableViewCellData]))
    
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
        case .expandable:
            return ExpandableTableViewCell.identifier
        }
    }
}

// MARK: - Equitable

extension TableViewCellData: Equatable {
    static func == (lhs: TableViewCellData, rhs: TableViewCellData) -> Bool {
        switch (lhs, rhs) {
        case (.subtitle(let _title, let _subtitle), .subtitle(let title_, let subtitle_)):
            return _title == title_ && _subtitle == subtitle_
        case (.rightDisclosure(let _title), .rightDisclosure(let title_)):
            return _title == title_
        case (.url(let _title, let _url), .url(let title_, let url_)):
            return _title == title_ && _url == url_
        case (.measurement(let _title, let _measurement), .measurement(let title_, let measurement_)):
            return _title == title_ && _measurement.isEqual(to: measurement_)
        case (.expandable(let _title, let _details), .expandable(let title_, let details_)):
            return _title == title_ && _details == details_
        default:
            return false
        }
    }
}
