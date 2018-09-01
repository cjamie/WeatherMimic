//
//  IconFetching.swift
//  WeatherMimic
//
//  Created by Admin on 9/1/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

typealias ImageHandler = (ImageResult) -> Void

protocol IconFetching {
    var iconString: String { get }
    var fetchSession: URLSession { get }
    var iconRequest: URLRequest { get }
    
    func getIcon(completion: @escaping ImageHandler)
}

extension IconFetching {
    var fetchSession: URLSession {
        return URLSession.shared
    }
    
    func getIcon(completion: @escaping ImageHandler) -> (){
        fetchSession.invalidateAndCancel()
        
        let handler: (Data?, URLResponse?, Error?) -> () = {
            let tuple = ($0, $1, $2)
            let result = HTTPImageResponseValidator(sessionTuple: tuple).validationResult
            completion(result)
        }
        
        fetchSession.dataTask(with: iconRequest, completionHandler: handler).resume()
    }
}

//this will define the default url for IconFetching
extension URLConstructible where Self: IconFetching{
    var host: String {
        return NetworkConstants.WeatherIcon.host
    }
    var scheme: String {
        return NetworkConstants.WeatherIcon.scheme
    }
    var path: String {
        return NetworkConstants.WeatherIcon.path
    }
    var items: QueryPreferences {
        return NetworkConstants.WeatherIcon.defaultItems
    }
}


