//
//  ExpandableTableViewCell.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 11/28/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class ExpandableTableViewCell: UITableViewCell {
    
    static let identifier = "ExpandableTableViewCell"

    var isExpanded: Bool = false
    
    var detailCellsData: [TableViewCellData] = []
    
    func toggle() {
        isExpanded.toggle()
    }
    
}

// MARK: - TableViewCellDataConfigurable

extension ExpandableTableViewCell: TableViewCellDataConfigurable {
    
    func configure(with tableViewData: TableViewCellData) {
        guard case let .expandable(title, details) = tableViewData else {
            return
        }
        
        textLabel?.text = title
        detailCellsData = details
    }
    
}
