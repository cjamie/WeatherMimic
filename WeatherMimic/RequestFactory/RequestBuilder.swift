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

typealias RequestModifyingClosure = (inout URLRequest) -> ()
//responsible for making a request. 
final class RequestFactory {
    //this was made to be a singleton with a private constructor
    public static let shared = RequestFactory()
    private let urlBuilder = URLBuilder()
    
    private lazy var getURL: (URLConstructible) -> URL? = {
        let retVal = self.urlBuilder.set(scheme: $0.scheme)
            .set(host: $0.host)
            .set(path: $0.path)
            .set(preferences: $0.items)
            .build()
        return retVal
    }
    
    //note: 1800 is 30 minutes = 30*60
    func makeWeatherRequest(urlParts: URLConstructible,
                            cachePolicy: URLRequest.CachePolicy = .reloadRevalidatingCacheData,
                            timeoutInterval: TimeInterval = 1800,
                            headerFields: HeaderFields = [:],
                            requestType: HTTPRequestType = .GET) -> URLRequest? {
        
        guard let url = getURL(urlParts) else {
            os_log("malformed url")
            return nil
        }
        
        let modificationBlock: RequestModifyingClosure = {
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
        
        print("checking the request ")
        
        let printables: [Any] = [
            request.allHTTPHeaderFields ?? [:],
            request.url ?? URL(string:"google.com")!,
            request.cachePolicy.rawValue,
            request.timeoutInterval,
            request.httpMethod ?? "POST"
        ].compactMap{$0}

        printables.forEach{ print($0) }
        
        return request
    }
    private init(){ }
}


extension URLRequest {
    //will take in cache policy, time interval, type of request, and
    static func build(_ modificationBlock: RequestModifyingClosure, url: URL) -> URLRequest {
        var baseRequest = URLRequest(url: url)
        modificationBlock(&baseRequest)
        return baseRequest
    }
}

