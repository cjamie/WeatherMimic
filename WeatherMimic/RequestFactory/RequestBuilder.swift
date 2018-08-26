//
//  RequestFactory.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log

enum HTTPRequestType: String {
    case GET
    case POST
    case DELETE
    case HEAD
    case PUT
    case CONNECT
    case OPTIONS
    case TRACE
}

typealias RequestModifier = (inout URLRequest) -> ()

//responsible for making a request. 
final class RequestFactory {
    //this was made to be a singleton with a private constructor
    public static let shared = RequestFactory()

    //note: 1800 is 30 minutes = 30*60
    func makeWeatherRequest(url: URL,
                            cachePolicy: URLRequest.CachePolicy = .reloadRevalidatingCacheData,
                            timeoutInterval: TimeInterval = 1800,
                            headerFields: HeaderFields = [:],
                            requestType: HTTPRequestType = .GET) -> URLRequest {
        
        
        let modificationBlock: RequestModifier = {
            request in
            
            if request.allHTTPHeaderFields == nil {
                request.allHTTPHeaderFields = [:]
            }
            
            request.allHTTPHeaderFields = headerFields
            request.url = url
            request.cachePolicy = cachePolicy
            request.timeoutInterval = timeoutInterval
            request.httpMethod = requestType.rawValue
        }
        
        let request = URLRequest.build(modificationBlock, url: url)
        
        privatePrint(request)
        return request
    }
    
    private func privatePrint(_ request: URLRequest) {
        print("checking the request ")
        
        let printables: [Any] = [
            request.allHTTPHeaderFields ?? [:],
            request.url ?? URL(string: "https://google.com")!,
            request.cachePolicy.rawValue,
            request.timeoutInterval,
            request.httpMethod ?? "POST"
        ].compactMap{$0}
        
        printables.forEach{ print($0) }
    }
    
    private init(){ }
}


