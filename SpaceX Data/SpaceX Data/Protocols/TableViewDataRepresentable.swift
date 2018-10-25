//
//  TableViewDataRepresentable.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/5/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol TableViewDataFullyRepresentable {
    var tableViewData: [TableViewCellData] { get }
}

protocol TableViewDataEssentiallyRepresentable {
    var essentialData: TableViewCellData { get }
}

extension Array: TableViewDataFullyRepresentable where Array.Element: TableViewDataEssentiallyRepresentable {
    var tableViewData: [TableViewCellData] {
        var tableViewData: [TableViewCellData] = []
        forEach({ tableViewData.append($0.essentialData) })
        return tableViewData
    }
}
