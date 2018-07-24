//
//  CompanyInfoDispatcher.swift
//  SpaceX Data
//
//  Created by Vadim Rupets on 7/24/18.
//  Copyright © 2018 Vadim Rupets. All rights reserved.
//

import Foundation

public class CompanyInfoDispatcher: Dispatcher {
    typealias ResponseObject = CompanyInfo
    typealias APIRequest = CompanyInfoRequests
    
    func executeRequest(_ request: CompanyInfoRequests, responseHandler: @escaping ((Response<CompanyInfo>) -> ())) {
        do {
            let urlRequest = try prepareURLRequest(request)
            let urlSession = URLSession(configuration: .default)
            
            let dataTask = urlSession.dataTask(with: urlRequest, completionHandler: { (data, urlResponse, error) in
                let response = Response<CompanyInfo>(response: urlResponse as? HTTPURLResponse, data: data, error: error)
                
                responseHandler(response)
            })
            
            print("Request: \(urlRequest.description)")
            dataTask.resume()
        } catch {
            responseHandler(Response.error(error))
        }
    }
}
