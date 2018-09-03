//
//  FontPresets.swift
//  WeatherMimic
//
//  Created by Admin on 8/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

typealias NameSizeTuple = (name: String, size: CGFloat)

enum FontPresets {
    //headline cell
    static let headlineCity: NameSizeTuple = ("AvenirNext-DemiBold", 40)
    static let headlineDescription: NameSizeTuple = ("AvenirNext-Light", 24)

    //temperature cell
    //TODO: there seems to be some light shadowing we should look to add later
    static let temperatureLabel: NameSizeTuple = ("AvenirNext-Light", 70)
    
    //dayInfo cell
    static let weekday: NameSizeTuple = ("AvenirNext-Medium", 24)
    static let todayText: NameSizeTuple = ("AvenirNext-Medium", 20)
    
    //general
    static let AvenirNextMedium26: NameSizeTuple = ("AvenirNext-Medium", 26)
    
}

enum FontPresent2{
    case avenirNextMedium(CGFloat)
    case avenirNextDemiBold(CGFloat)
    case avenirBlack(CGFloat)
}

extension FontPresent2 {
    var font: UIFont {
        var retVal: UIFont?
        
        switch self{
        case .avenirBlack(let size):
            retVal = UIFont(name: "Avenir-Black", size: size)
        case .avenirNextDemiBold(let size):
            retVal = UIFont(name: "AvenirNext-DemiBold", size: size)
        case .avenirNextMedium(let size):
            retVal = UIFont(name: "AvenirNext-Medium", size: size)
        }
        
        return retVal ?? UIFont.systemFont(ofSize: 8)
    }
}

