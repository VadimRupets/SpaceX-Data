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

extension SubtitleTableViewCell: TableViewDataConfigurable {
    func configure(with tableViewData: [String : Any]) {
        let title = tableViewData[TableViewDataKeys.title.rawValue] as? String
        let subtitle = tableViewData[TableViewDataKeys.subtitle.rawValue] as? String
        
        self.textLabel?.text = title
        self.detailTextLabel?.text = subtitle
    }
}
