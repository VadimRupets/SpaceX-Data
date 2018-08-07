//
//  RocketsDispatcher.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 8/7/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

public class RocketsDispatcher: Dispatcher {
    typealias ResponseObject = [Rocket]
    typealias APIRequest = RocketsRequests
    
    func executeRequest(_ request: RocketsRequests, responseHandler: @escaping ((Response<[Rocket]>) -> ())) {
        do {
            let urlRequest = try prepareURLRequest(request)
            let urlSession = URLSession(configuration: .default)
            
            let dataTask = urlSession.dataTask(with: urlRequest, completionHandler: { (data, urlResponse, error) in
                let response = Response<[Rocket]>(response: urlResponse as? HTTPURLResponse, data: data, error: error)
                
                responseHandler(response)
            })
            
            print("Request resumed: \(urlRequest)")
            dataTask.resume()
        } catch {
            responseHandler(Response.error(error))
        }
    }
}
