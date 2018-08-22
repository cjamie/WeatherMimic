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
    
    func makeWeatherRequest(urlParts :URLParts, cachePolicy: URLRequest.CachePolicy? = nil, timeoutInterval: TimeInterval? = nil) -> RequestResult {
        //TODO: modify this.
        let url = URL(string: "")!

        if let cachePolicy = cachePolicy, let timeoutInterval = timeoutInterval {
            //make a URLRequest with this information.
            return requestBuilder(url, cachePolicy, timeoutInterval)
        }else{

        }
        
        fatalError()
    }
    
    private let requestBuilder: (URL, URLRequest.CachePolicy, TimeInterval) -> RequestResult = {
        url, policy, timeInterval in
        let request = URLRequest(url: url, cachePolicy: policy, timeoutInterval: timeInterval)
        return RequestResult.URLRequest(request: request)
    }

    private init(){ }
}
