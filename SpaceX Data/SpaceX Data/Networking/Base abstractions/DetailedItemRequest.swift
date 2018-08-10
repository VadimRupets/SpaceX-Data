//
//  DetailedItemRequest.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/10/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol DetailedItemRequest: Request {
    var itemID: String { get }
}
