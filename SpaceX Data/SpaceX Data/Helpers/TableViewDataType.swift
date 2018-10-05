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
    `default`,
    url,
    measurement
}

enum TableViewDataKeys: String {
    case
    type,
    title,
    subtitle,
    measurement,
    url
}

func tableViewData(with type: TableViewDataType, arguments: Any...) -> [String: Any] {
    var tableViewData = [String: Any]()
    
    tableViewData[TableViewDataKeys.type.rawValue] = type
    
    switch arguments.first {
    case let string as String:
        tableViewData[TableViewDataKeys.title.rawValue] = string
    default:
        break
    }
    
    switch arguments.last {
    case let string as String:
        tableViewData[TableViewDataKeys.subtitle.rawValue] = string
    case let measurement as Measurement:
        tableViewData[TableViewDataKeys.measurement.rawValue] = measurement
    case let url as URL:
        tableViewData[TableViewDataKeys.url.rawValue] = url
    default:
        break
    }
    
    return tableViewData
}
