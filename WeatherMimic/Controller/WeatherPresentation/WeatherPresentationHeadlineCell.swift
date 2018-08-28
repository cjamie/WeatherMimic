//
//  WeatherPresentationHeadlineCell.swift
//  WeatherMimic
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

typealias LabelBuilder = (UILabel) -> ()

final class WeatherPresentationHeadlineCell: UICollectionViewCell {
    
    static let reuseIdentifier = "WeatherPresentationHeadlineCell"
    
    var viewModelManager: HeadlineDescribing? {
        didSet {
            guard let viewModelManager = viewModelManager else {
                return
            }
            cityLabel.text = viewModelManager.cityName
            descriptionLabel.text = viewModelManager.weatherDescription
        }
    }
    
    lazy var cityLabel: UILabel = {
        UILabel.build2(block: LabelPresets.cityNameLabelModifer)
        
//        UILabel.build(block: LabelPresets.cityNameLabelModifer)
    }()
    
    //TODO: these closures can be put into a presets struct    
    lazy var descriptionLabel: UILabel = {
        UILabel.build{ LabelPresets.descriptionLabelModifier($0) }
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        subviewsToAdd.forEach(addSubview)
        anchorSubviews()
        
        backgroundColor = UIColor.red
    }
    
    var subviewsToAdd: [UIView] {
        return [ cityLabel, descriptionLabel ]
    }
    
    private func anchorSubviews() {
        let cityLabelPadding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        cityLabel.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: cityLabelPadding)
        descriptionLabel.anchor(top: cityLabel.bottomAnchor, leading: cityLabel.leadingAnchor, trailing: cityLabel.trailingAnchor)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
