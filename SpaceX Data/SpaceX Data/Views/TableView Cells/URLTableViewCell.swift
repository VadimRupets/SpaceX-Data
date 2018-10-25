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

extension URLTableViewCell: TableViewCellDataConfigurable {
    func configure(with tableViewData: TableViewCellData) {
        guard case let .url(title, url) = tableViewData else {
            return
        }
        
        textLabel?.text = title
        self.url = url
    }
}
