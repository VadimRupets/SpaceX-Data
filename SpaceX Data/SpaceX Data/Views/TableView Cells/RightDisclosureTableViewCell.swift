//
//  RightDisclosureTableViewCell.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/5/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class RightDisclosureTableViewCell: UITableViewCell {
    static let identifier = "RightDisclosureTableViewCell"
}

extension RightDisclosureTableViewCell: TableViewDataConfigurable {
    func configure(with tableViewData: TableViewCellData) {
        guard case let .rightDisclosure(title) = tableViewData else {
            return
        }
        
        textLabel?.text = title
    }
}
