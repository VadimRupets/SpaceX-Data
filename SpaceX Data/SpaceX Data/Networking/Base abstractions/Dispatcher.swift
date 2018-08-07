//
//  Dispatcher.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 2/14/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

protocol Dispatcher {
    associatedtype ResponseObject: Decodable
    associatedtype APIRequest: Request
    func executeRequest(_ request: APIRequest, responseHandler: @escaping ((Response<ResponseObject>) -> ()))
}

extension Dispatcher {
    
    var host: String {
        return "https://api.spacexdata.com/v2/"
    }
    
    func prepareURLRequest(_ request: Request) throws -> URLRequest {
        guard let url = URL(string: host + request.endpoint) else {
            throw NetworkError.badInput
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        
        guard let parameters = request.parameters else { return urlRequest }
        
        guard request.httpMethod == .get else {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            return urlRequest
        }
        
        guard let urlParameters = parameters as? [String: String] else { throw NetworkError.badInput }
        
        let queryItems = urlParameters.map { return URLQueryItem(name: $0.key, value: $0.value) }
        
        guard var components = URLComponents(string: url.absoluteString) else { throw NetworkError.badInput }
        
        components.queryItems = queryItems
        urlRequest.url = components.url
        
        return urlRequest
    }
    
}
