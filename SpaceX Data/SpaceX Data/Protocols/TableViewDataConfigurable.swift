//
//  TableViewDataConfigurable.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 10/5/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import UIKit

protocol TableViewDataConfigurable where Self: UITableViewCell {
    func configure(with tableViewData: [String: Any])
}
