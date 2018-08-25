//
//  UIFont+Custom.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

extension UIFont {
    private enum FontComponents{
        static let headline: (name: String, size: CGFloat) = ("AvenirNext-Medium", 20)
        
    }
    
    static var weatherMimicHeadline: UIFont {
        return UIFont(name: FontComponents.headline.name, size: FontComponents.headline.size) ?? UIFont()
    }
    
}
