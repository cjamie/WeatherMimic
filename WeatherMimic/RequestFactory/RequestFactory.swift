//
//  RequestFactory.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log

enum RequestResult{
    case URL(url: URL)
    case URLRequest(request: URLRequest)
}


//will return a url or request based on parameters.
final class RequestFactory {
    
    //this was made to be a singleton with a private constructor
    public static let shared = RequestFactory()
    
    private let urlBuilder = URLBuilder()
    
    func makeRequest(urlParts :URLParts, cachePolicy: URLRequest.CachePolicy?, timeoutInterval: TimeInterval?) -> RequestResult {
        
        if let cachePolicy = cachePolicy, let timeoutInterval = timeoutInterval {
            //make a URLRequest with this information.
            
        }
        fatalError()
    }
    
    private let requestBuilder: (URL, URLRequest.CachePolicy, TimeInterval) -> URLRequest = {
        url, policy, timeInterval in
        URLRequest(url: url, cachePolicy: policy, timeoutInterval: timeInterval)
    }
    

    private init(){ }
}
