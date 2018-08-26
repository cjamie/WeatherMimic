//
//  URLBuilder.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

typealias QueryPreferences = [String: String]
typealias HeaderFields = [String: String]

protocol Building{
    associatedtype BuildingType
    func build() -> BuildingType?
}

//TODO: verify if this relationship is accurate
protocol URLBuilding: Building where BuildingType == URL {
    func set(host: String) -> Self
    func set(scheme: String) -> Self
    func set(path: String) -> Self
    func set(preferences: QueryPreferences) -> Self
}

//TODO: is this more of a facade?
final class URLBuilder {
    
    private let urlComponents = NSURLComponents()
    
    //MARK: Helpers
    
    //takes in a tuple of (String, String) and returns a URLQueryItem type
    private lazy var makeUrlQueryItem:(_ preferences: (String, String) ) -> URLQueryItem = {
        URLQueryItem(name: $0.0, value: $0.1)
    }
}

extension URLBuilder: URLBuilding {
    @discardableResult
    func set(host: String) -> Self {
        urlComponents.host = host
        return self
    }
    
    @discardableResult
    func set(scheme: String) -> Self {
        urlComponents.scheme = scheme
        return self
    }
    
    func set(path: String) -> Self {
        urlComponents.path = path
        return self
    }
    
    @discardableResult
    func set(preferences: QueryPreferences) -> Self {
        if urlComponents.queryItems == nil {
            urlComponents.queryItems = []
        }
        
        let queryItems = preferences.map(makeUrlQueryItem)
        urlComponents.queryItems?.append(contentsOf: queryItems)
        
        return self
    }
    
    func build() -> URL? {
        print("urlbuilder's url: \(urlComponents.url!)")
        return urlComponents.url
    }
}
