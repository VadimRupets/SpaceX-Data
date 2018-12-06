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
    
    lazy var disclosureImageView: UIImageView? = {
        guard
            let button = subviews.first(where: { $0 is UIButton }) as? UIButton,
            let imageView = button.subviews.first(where: { $0 is UIImageView }) as? UIImageView else {
                return nil
        }
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()

    var isExpanded: Bool = false
    
    var detailCellsData: [TableViewCellData] = []
    
    func toggle() {
        isExpanded.toggle()
        rotateDisclosureImageView()
    }
    
    private func rotateDisclosureImageView() {
        disclosureImageView?.transform = isExpanded ? CGAffineTransform(rotationAngle: CGFloat.pi / 2.0) : CGAffineTransform.identity
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
