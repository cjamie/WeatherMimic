//
//  LabelPresets.swift
//  WeatherMimic
//
//  Created by Admin on 8/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

enum ViewPresets{
    //MARK: Headline Cell
    
    static let cityNameLabelModifer: LabelBuilder = {
        label in
        label.text = "{FPO: Temporary City Name}"
        let headlineCityFont = UIFont.from(.avenirNextDemiBold(40))
        label.font = headlineCityFont
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
    
    static let triHourlyLabelModifier: LabelBuilder = {
        label in
        label.text = "{FPO: Temporary Hour Name}"
        label.font = UIFont.from(.avenirNextMedium(26))
        label.textAlignment = .center
        label.backgroundColor = UIColor.darkGray
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
//        label.lineBreakMode = .byWordWrapping
        
    }
    
    static let smallTemperatureLabelModifier: LabelBuilder = {
        label in
        label.text = "{FPO: Temporary Tempature Name}"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.from(.avenirNextMedium(14))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
    }


    static let iconView: (UIImageView) -> Void = {
        imageView in
        //use a placeholder image in there for now.
        let temp = imageView
        imageView.image = UIImage(named: "<#T##String#>")
        return imageView
    }

}
