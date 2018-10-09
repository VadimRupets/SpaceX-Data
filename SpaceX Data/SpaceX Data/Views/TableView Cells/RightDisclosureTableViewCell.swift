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
    func configure(with tableViewData: [String : Any]) {
        textLabel?.text = tableViewData[TableViewDataKeys.title.rawValue] as? String
    }
}
