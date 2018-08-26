//
//  URLRequest+Modifier.swift
//  WeatherMimic
//
//  Created by Admin on 8/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

extension URLRequest {
    //will take in a modification closure to build a URLRequest instance
    static func build(_ modificationBlock: RequestModifier, url: URL) -> URLRequest {
        var baseRequest = URLRequest(url: url)
        modificationBlock(&baseRequest)
        return baseRequest
    }
}
