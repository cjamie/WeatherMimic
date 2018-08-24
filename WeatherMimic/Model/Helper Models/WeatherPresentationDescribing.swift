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

//extension WeatherPresentationDescribing{
//    init(stateName: String){
//        self.init(stateName: stateName)
//    }
//}


struct WeatherPresentationModel: WeatherPresentationDescribing {
    
    var stateName: String
    
    //Adapter pattern
}



// an adapter will be made to adapt the structure to our desired type.
//
