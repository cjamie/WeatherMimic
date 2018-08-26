//
//  AuthTokenFetcher.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import os.log

//TODO: might want this to be optional
//this will be responsible for fetching auth token
typealias AuthCompletion = (AuthToken) -> ()

protocol AuthTokenFetching {
    func getAuthToken(_  completion: @escaping AuthCompletion)
}

extension AuthTokenFetching{
    //can leave this unimplemented for now and just call completion block
    func getAuthToken(_ completion: @escaping AuthCompletion) {
        os_log("theres currently no implementation for getting auth token")
        let authToken = ""
        completion(authToken) //this is just a query parameter? not in the http fields?
        
    }
}
class AuthTokenFetcher: AuthTokenFetching { }
