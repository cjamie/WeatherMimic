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
    var host    : String { get }
    var scheme  : String { get }
    var path    : String { get }
    var items   : QueryPreferences { get }
}

extension URLConstructible {
    var host: String {
        return NetworkConstants.Weather.host
    }
    var scheme: String {
        return NetworkConstants.Weather.scheme
    }
    var path: String {
        return NetworkConstants.Weather.path
    }
    var items: QueryPreferences {
        return NetworkConstants.Weather.defaultItems
    }
}

struct URLConstructibleConcrete: URLConstructible { }
