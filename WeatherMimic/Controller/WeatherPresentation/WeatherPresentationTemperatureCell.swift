//
//  WeatherPresentationTemperatureCell.swift
//  WeatherMimic
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

final class WeatherPresentationTemperatureCell: UICollectionViewCell {
    
    static let reuseIdentifier = "WeatherPresentationTemperatureCell"
    
    var boxedManager: Box<WeatherForecastDataManager?> = Box(nil) {
        didSet {
            boxedManager.bind {
                [weak self] manager in //Question: is this weak self necessary here?
                guard let strongSelf = self else {
                    os_log("temperatureCell is nil")
                    return
                }
                let temperatureAdapted: TemperatureDescribing? = manager
                strongSelf.temperatureLabel.text = temperatureAdapted?.temperature
            }
        }
    }
    
    
    lazy var temperatureLabel: UILabel = {
       UIView.build(block: ViewPresets.temperatureLabelModifier)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(temperatureLabel)
        temperatureLabel.anchor(top: topAnchor,
                                leading: leadingAnchor,
                                bottom: bottomAnchor,
                                trailing: trailingAnchor)
        backgroundColor = UIColor.purple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherPresentationTemperatureCell: ViewHeightDelegate{
    var viewHeight: CGFloat{
        let myHeight = (temperatureLabel.text ?? "").height(withConstrainedWidth: UIScreen.main.bounds.width, font: temperatureLabel.font)
        print("temperature cell height calculated to be \(myHeight)")
        return myHeight
    }
}

