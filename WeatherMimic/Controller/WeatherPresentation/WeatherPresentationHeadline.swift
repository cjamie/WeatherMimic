//
//  WeatherPresentationHeadline.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

typealias LabelBuilder = (UILabel) -> ()

protocol HeadlineDependency{
    var cityName: String { get }
    var weatherDescription: String { get }
}

final class WeatherPresentationHeadlineCell: UICollectionViewCell {

    var dependency: HeadlineDependency?
    
    lazy var modifyCityNameLabel: LabelBuilder = {
        label in
        label.text = self.dependency?.cityName
        label.font = UIFont.weatherMimicHeadlineCity
    }
    
    lazy var modifyWeatherDescriptionLabel: LabelBuilder = {
        label in
        label.font = UIFont.weatherMimicHeadlineDescription
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let cityLabel = UILabel.build(block: modifyCityNameLabel)
        
        
        
        addSubview(cityLabel)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var buildWeatherDescriptionLabel: ()->() = {
        
    }
}
