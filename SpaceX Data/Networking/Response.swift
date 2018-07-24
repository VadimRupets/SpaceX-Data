//
//  Response.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 2/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

public enum Response<T> where T: Decodable {
    case
    data(T),
    error(Error?)
    
    init(response: HTTPURLResponse?, data: Data?, error: Error?) {
        print("Request response: \(response.debugDescription)")
        guard response?.statusCode == 200, error == nil else {
            self = .error(error)
            return
        }
        
        guard let data = data else {
            self = .error(NetworkError.noData)
            return
        }
        
        do {
            let responseObject = try JSONDecoder().decode(T.self, from: data)
            self = .data(responseObject)
        } catch {
            self = .error(error)
        }
    }
}
