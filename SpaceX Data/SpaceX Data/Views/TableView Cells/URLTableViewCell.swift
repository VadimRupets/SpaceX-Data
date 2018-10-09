//
//  URLTableViewCell.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/4/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class URLTableViewCell: UITableViewCell {
    static let identifier = "URLTableViewCell"
    
    var url: URL?
}

extension URLTableViewCell: TableViewDataConfigurable {
    func configure(with tableViewData: [String : Any]) {
        textLabel?.text = tableViewData[TableViewDataKeys.title.rawValue] as? String
        url = tableViewData[TableViewDataKeys.url.rawValue] as? URL
    }
}
