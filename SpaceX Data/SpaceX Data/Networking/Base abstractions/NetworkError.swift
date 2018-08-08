//
//  NetworkError.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 2/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case
    noData,
    corruptedData,
    badInput,
    notReachable
}
