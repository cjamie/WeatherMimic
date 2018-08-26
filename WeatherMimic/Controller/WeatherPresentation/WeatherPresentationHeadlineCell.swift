//
//  WeatherPresentationHeadlineCell.swift
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

    static let reuseIdentifier = "WeatherPresentationHeadlineCell"
    var dependency: HeadlineDependency?
    
    //closures to help instantiate
    lazy var cityNameLabelModifer: LabelBuilder = {
        label in
        label.text = self.dependency?.cityName
        label.font = UIFont.from(nameSize: FontPresets.headlineCity)
    }
    
    lazy var weatherDescriptionLabelModifier: LabelBuilder = {
        label in
        label.text = self.dependency?.weatherDescription
        label.font = UIFont.from(nameSize: FontPresets.headlineDescription)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        //this will create a label with city label attributes
        let cityLabel = UILabel.build(block: cityNameLabelModifer)
        let descriptionLabel = UILabel.build(block: weatherDescriptionLabelModifier)
        
        [cityLabel, descriptionLabel].forEach(addSubview)
        
        print(subviews)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var buildWeatherDescriptionLabel: ()->() = {
        
    }
}
