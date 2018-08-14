//
//  Response.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 2/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

enum Response<T> where T: Decodable {
    case
    data(T),
    error(Error?)
    
    init(response: HTTPURLResponse? = nil, data: Data? = nil, error: Error? = nil) {
        guard response?.statusCode == 200, error == nil else {
            let responseError = error ?? NetworkError.noData
            response?.printDescription(with: responseError)
            self = .error(responseError)
            return
        }
        
        guard let data = data else {
            response?.printDescription(with: NetworkError.noData)
            self = .error(NetworkError.noData)
            return
        }
        
        if let jsonObject = try? JSONSerialization.jsonObject(with: data) {
            response?.printDescription(with: jsonObject)
        }
        
        do {
            let responseObject = try JSONDecoder().decode(T.self, from: data)
            self = .data(responseObject)
        } catch {
            self = .error(error)
        }
    }
}
