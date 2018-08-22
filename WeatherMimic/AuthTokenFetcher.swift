//
//  AuthTokenFetcher.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//this will be responsible for fetching auth token
protocol AuthTokenFetching{
    typealias completionHandler = () -> ()
    func getAuthToken(_  completion: @escaping completionHandler)
}

class AuthTokenFetcher: AuthTokenFetching{
    //can leave this unimplemented for now and just call completion block
    func getAuthToken(_ completion: @escaping () -> ()) {
        completion()
    }
}
