//
//  WeatherPresentationDescribing.swift
//  WeatherMimic
//
//  Created by Admin on 8/23/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

//we will define all of the require parameters for our view controller here
protocol WeatherPresentationDescribing {
    var stateName: String { get }
}

struct WeatherPresentationModel: WeatherPresentationDescribing {
    var stateName: String
}
