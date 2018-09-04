//
//  WeatherPresentationTopGridCell.swift
//  WeatherMimic
//
//  Created by Jamie Chu on 9/3/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

//will have an icon, weekday, hightemp, lowtemp

final class WeatherPresentationTopGridCell: UICollectionViewCell {
    
    
    static let reuseIdentifier = "WeatherPresentationTopGridCell"
    
    var dataSource: ShortDailyForecast?
    
    let imageView: UIImageView = {
        UIView.build(block: ViewPresets.iconViewModifier)
    }()
    
    let weekDayLabel: UILabel = {
        UIView.build(block: ViewPresets.descriptionLabelModifier)
    }()
    
    let highTempLabel : UILabel = {
        UIView.build(block: ViewPresets.descriptionLabelModifier)
    }()

    let lowTempLabel : UILabel = {
        UIView.build(block: ViewPresets.descriptionLabelModifier)
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [ imageView,
          weekDayLabel,
          highTempLabel,
          lowTempLabel ].forEach( addSubview )

        weekDayLabel.anchor(top: topAnchor,
                            leading: leadingAnchor,
                            bottom: bottomAnchor,
                            trailing: nil)
        imageView.anchor(top: weekDayLabel.topAnchor,
                         leading: weekDayLabel.trailingAnchor,
                         bottom: weekDayLabel.bottomAnchor,
                         trailing: nil)
        highTempLabel.anchor(top: weekDayLabel.topAnchor,
                             leading: imageView.trailingAnchor,
                             bottom: weekDayLabel.bottomAnchor,
                             trailing: nil)
        lowTempLabel.anchor(top: weekDayLabel.topAnchor,
                            leading: highTempLabel.trailingAnchor,
                            bottom: weekDayLabel.bottomAnchor,
                            trailing: trailingAnchor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
