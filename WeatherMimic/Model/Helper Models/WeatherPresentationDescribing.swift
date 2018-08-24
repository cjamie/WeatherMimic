//
//  WeatherPresentationDescribing.swift
//  WeatherMimic
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//we will define all of the require parameters for our view controller here
protocol WeatherPresentationDescribing{

    var temp: String { get }
    
    init(temp: String)
}

extension WeatherPresentationDescribing{
    init(temp: String){
        self.init(temp: temp)
    }
}

struct WeatherPresentationModel: WeatherPresentationDescribing{
    
    var temp: String
}


//an adapter will be made to adapt the structure to our desired type. 
