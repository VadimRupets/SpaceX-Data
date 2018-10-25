//
//  TableViewDataRepresentable.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/5/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol TableViewCellDataFullyRepresentable {
    var tableViewData: [TableViewCellData] { get }
}

protocol TableViewCellDataEssentiallyRepresentable {
    var essentialData: TableViewCellData { get }
}

extension Array: TableViewCellDataFullyRepresentable where Array.Element: TableViewCellDataEssentiallyRepresentable {
    var tableViewData: [TableViewCellData] {
        var tableViewData: [TableViewCellData] = []
        forEach({ tableViewData.append($0.essentialData) })
        return tableViewData
    }
}
