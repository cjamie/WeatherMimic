//
//  DayInfoDescribing.swift
//  WeatherMimic
//
//  Created by Admin on 8/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

protocol DayInfoDescribing {
    var weekDay: String { get }
    //var today is not necessary 
    
    var highTemp: String { get }
    var lowTemp: String { get }
}
