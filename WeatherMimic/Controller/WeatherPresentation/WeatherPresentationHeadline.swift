//
//  WeatherPresentationHeadline.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

typealias LabelBuilder = (UILabel) -> ()

final class WeatherPresentationHeadlineBuilder {

    
    init(){
        
    }
    
    //build module 1
    func buildCityLabel(){
        let modifyLabelClosure: LabelBuilder = {
            label in
            
            label.text = "Some Text"
            label.font = UIFont.weatherMimicHeadline
        }
        
        UILabel.build(block: modifyLabelClosure)
    }
}
