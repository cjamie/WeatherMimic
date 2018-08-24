//
//  NetworkConstants.swift
//  WeatherMimic
//
//  Created by Admin on 8/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//will create a namespace for constants
enum NetworkConstants{
    enum Weather{
        static let scheme = "https"
        static let host = "api.openweathermap.org"
        static let path = "/data/2.5/forecast"
        
        //these will be the default items, and will vary dependening on user defaults. s
        static var defaultItems: [String: String] = [
            "id":"3342",  //
            "q":"Boston", //q denotes the city
            "units":"Imperial",
            "cnd":"5", //default number of dates will be this.
            //API KEY
            "appid":"50a2ca8b91084f6abba83ae937599fb9"
        ]
    }
}


// MARK: will add helper functions for convenience. 
extension NetworkConstants{
    
}
