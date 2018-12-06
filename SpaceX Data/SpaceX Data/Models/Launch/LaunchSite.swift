//
//  LaunchSite.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/15/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

struct LaunchSite: CustomStringConvertible {
    let id: String
    let code: String
    let description: String
}

extension LaunchSite: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case
        id = "site_id",
        code = "site_name",
        description = "site_name_long"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(String.self, forKey: .id)
        self.code = try values.decode(String.self, forKey: .code)
        self.description = try values.decode(String.self, forKey: .code)
    }
    
}

// MARK: - TableViewCellDataFullyRepresentable

extension LaunchSite: TableViewCellDataFullyRepresentable {
    
    var tableViewData: [TableViewCellData] {
        return [TableViewCellData.subtitle((title: "Launch site", subtitle: description))]
    }
    
}
