//
//  Fetcher.swift
//  WeatherMimic
//
//  Created by Admin on 8/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log

/*
 Fetcher would have a url, a urlsession, and dependency item for url
 */

protocol Fetcher {
    var urlDependency: URLConstructible { get }
    var url: URL { get }
    var fetchSession: URLSession { get }
}

/*
 default urlDependency will be from NetworkConstants
 url will get clauclated based on urlDependnecy
 default session will be ephemeral
 */

extension Fetcher {
    var urlDependency: URLConstructible {
        //we will default to weather constants
        return URLConstructibleConcrete()
    }
    
    var url: URL {
        guard let url = URLBuilder()
            .set(host: urlDependency.host)
            .set(path: urlDependency.path)
            .set(preferences: urlDependency.items)
            .set(scheme: urlDependency.scheme)
            .build() else {
                os_log("default url extension is bad!")
                fatalError()
        }
        return url
    }
    
    //default weathersession will be ephemeral type. it will overwrite fetcher session
    var fetchSession: URLSession {
        return URLSession.shared
    }
}
