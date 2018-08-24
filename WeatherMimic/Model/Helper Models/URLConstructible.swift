//
//  URLConstructible.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//components needed for the URL

//this protocol defines list of dependencies that a url requires
//URLConstructible
protocol URLConstructible {
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    var items: QueryPreferences { get }
    
    init(host: String, scheme: String, path: String, items: QueryPreferences)
}

struct URLConstructibleConcrete: URLConstructible {
    let host: String
    let scheme: String
    let path: String
    var items: QueryPreferences
}
