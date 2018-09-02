//
//  WeatherPresentationAccuCell.swift
//  WeatherMimic
//
//  Created by Admin on 9/1/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

final class WeatherPresentationAccuCell: UICollectionViewCell {
    
    
    //TODO: does this work?
    override var subviews: [UIView] {
        //hourLabel, iconImage, temperature (in celsius)
        
        return [triHourlyLabel, tempLabel]
    }
    
    
    let triHourlyLabel: UILabel = {
        UILabel.build(block: LabelPresets.triHourlyLabelModifier)
    }()
    
    let tempLabel: UILabel = {
        UIView.build(block: LabelPresets.smallTemperatureLabelModifier)
    }()

    let imageView: UIImageView = {
        UIView.build(block: LabelPresets.temperatureLabelModifier)
    }P()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        subviewsToAdd.forEach( addSubview )
        backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherPresentationAccuCell : ViewHeightDelegate {
    var viewHeight: CGFloat {
        return 100 //TODO: calculate dynamic height
    }
    

}
