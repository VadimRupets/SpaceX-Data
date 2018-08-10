//
//  LaunchpadRequests.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum LaunchpadRequest: String, Request {
    case
    kwajalein = "kwajalein_atoll",
    capeCanaveral40 = "ccafs_slc_40",
    capeCanaveral13 = "ccafs_slc_13",
    kennedy13 = "ksc_lc_39a",
    vanderberg3w = "vafb_slc_3w",
    vanderberg4e = "vafb_slc_4e",
    vanderberg4w = "vafb_slc_4w",
    spacexSouthTexas = "stls"
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var endpoint: String {
        return "launchpads/".appending(rawValue)
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    
}
