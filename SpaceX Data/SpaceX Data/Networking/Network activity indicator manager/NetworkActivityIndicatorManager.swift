//
//  NetworkActivityIndicatorManager.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation
import UIKit

class NetworkActivityIndicatorManager {
    @available(*, unavailable)
    init() {
        fatalError()
    }
    
    private static let userDefaultKey = "networkRequestsUUIDs"
    
    private static var networkRequestsUUIDs = SynchronizedArray<String>()
    
    static func registerNetworkRequestUUID(_ uuid: UUID) {
        networkRequestsUUIDs.append(uuid.uuidString)
        
        DispatchQueue.main.async {
            if !UIApplication.shared.isNetworkActivityIndicatorVisible {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            }
        }
    }
    
    static func unregisterNetworkRequestUUID(_ uuid: UUID) {
        guard let indexOfUUID = networkRequestsUUIDs.index(of: uuid.uuidString) else {
            return
        }
        
        _ = networkRequestsUUIDs.remove(at: indexOfUUID)
        
        DispatchQueue.main.sync {
            if networkRequestsUUIDs.count == 0 {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
}
