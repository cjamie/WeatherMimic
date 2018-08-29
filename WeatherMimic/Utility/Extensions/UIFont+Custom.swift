//
//  UIFont+Custom.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

extension UIFont {    
    static func from(nameSize tuple: NameSizeTuple) -> UIFont {
        return self.init(name: tuple.name, size: tuple.size) ?? systemFont(ofSize: tuple.size)
    }
}

