//
//  URLParts.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//components needed for the URL
typealias QueryItems = [String: String]

//this protocol defines list of dependencies that a url requires
protocol URLParts {
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    var items: QueryItems { get }
}

struct URLPartsConcrete: URLParts {
    let host: String
    let scheme: String
    let path: String
    var items: QueryItems
}
