//
//  URLTableViewCell.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/4/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

class URLTableViewCell: UITableViewCell {

    var url: URL?
    
    func configure(with title: String, url: URL) {
        textLabel?.text = title
        self.url = url
    }

}
