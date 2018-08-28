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
    
    func executeRequest(_ request: APIRequest, responseHandler: @escaping ((Response<ResponseObject>) -> ())) {
        let requestUUID = UUID()
        NetworkActivityIndicatorManager.registerNetworkRequestUUID(requestUUID)
        
        do {
            let urlRequest = try prepareURLRequest(request)
            let urlSession = URLSession(configuration: .default)
            
            let dataTask = urlSession.dataTask(with: urlRequest, completionHandler: { (data, urlResponse, error) in
                let response = Response<ResponseObject>(response: urlResponse as? HTTPURLResponse, data: data, error: error)
                
                NetworkActivityIndicatorManager.unregisterNetworkRequestUUID(requestUUID)
                responseHandler(response)
            })
            
            print("Request resumed: \(urlRequest.description)")
            dataTask.resume()
        } catch {
            NetworkActivityIndicatorManager.unregisterNetworkRequestUUID(requestUUID)
            responseHandler(Response.error(error))
        }
    }
}

private extension Dispatcher {
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
        
        let queryItems = prepareURLQueryItems(for: request)
        
        guard var components = URLComponents(string: url.absoluteString) else { throw NetworkError.badInput }
        
        components.queryItems = queryItems
        urlRequest.url = components.url
        
        return urlRequest
    }
    
    func prepareURLQueryItems(for request: Request) -> [URLQueryItem] {
        guard let parameters = request.parameters else { return [] }
        
        var urlQueryItems = [URLQueryItem]()
        parameters.forEach { key, value in
            switch value {
            case let arrayValue as [CustomStringConvertible]:
                arrayValue.forEach {
                    let stringValue = $0.description
                    urlQueryItems.append(URLQueryItem(name: key, value: stringValue))
                }
            case let customStringConvertibleValue as CustomStringConvertible:
                let stringValue = customStringConvertibleValue.description
                urlQueryItems.append(URLQueryItem(name: key, value: stringValue))
            default:
                break
            }
        }
        
        return urlQueryItems
    }
}
