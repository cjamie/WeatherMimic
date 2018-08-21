//
//  URLBuilder.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol URLBuilding{
//    func set(host: String) -> Self
//    func set(scheme: String) -> Self
//    func set(path: String) -> Self
}

//this is more of a facade?

final class URLBuilder: URLBuilding{
    private let urlComponents = NSURLComponents()
    
    private lazy var modifyURLComponents: (URLParts) -> () = {
        parts in
        
        self.urlComponents.scheme = parts.scheme
        self.urlComponents.host = parts.host
        self.urlComponents.path = parts.path
        
        
        if self.urlComponents.queryItems == nil {
            self.urlComponents.queryItems = []
        }
        let queryItems = parts.items.map{ URLQueryItem(name: $0.key, value: $0.value) }
        
        self.urlComponents.queryItems?.append(contentsOf: queryItems)
    }
    
    
    
    
    
    
}
