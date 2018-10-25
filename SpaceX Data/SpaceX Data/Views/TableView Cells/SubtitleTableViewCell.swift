//
//  SubtitleTableViewCell.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/5/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class SubtitleTableViewCell: UITableViewCell {
    static let identifier = "SubtitleTableViewCell"
}

extension SubtitleTableViewCell: TableViewCellDataConfigurable {
    func configure(with tableViewData: TableViewCellData) {
        guard case let .subtitle(title, subtitle) = tableViewData else {
            return
        }
        
        self.textLabel?.text = title
        self.detailTextLabel?.text = subtitle
    }
}
