//
//  LabelPresets.swift
//  WeatherMimic
//
//  Created by Admin on 8/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

enum LabelPresets{
    //MARK: Headline Cell
    
    static let cityNameLabelModifer: LabelBuilder = {
        label in
        label.text = "{FPO: Temporary City Name}"
        label.font = UIFont.from(nameSize: FontPresets.headlineCity)
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        
        label.backgroundColor = UIColor.blue
    }
    
    static let descriptionLabelModifier: LabelBuilder = {
        label in
        label.text = "{FPO: Temporary Description Name}"
        label.textColor = UIColor.white
        label.font = UIFont.from(nameSize: FontPresets.headlineDescription)
        label.textAlignment = .center
        label.backgroundColor = UIColor.darkGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

    }
    
    //MARK:
    static let temperatureLabelModifier: LabelBuilder = {
        label in
        label.text = "{FPO: Temporary Tempature Name}"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.from(nameSize: FontPresets.temperatureLabel)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

    }
}
