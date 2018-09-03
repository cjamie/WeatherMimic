//
//  WeatherPresentationTopGridCell.swift
//  WeatherMimic
//
//  Created by Jamie Chu on 9/3/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

final class WeatherPresentationTopGridCell: UICollectionViewCell {
    static let reuseIdentifier = "WeatherPresentationTopGridCell"
    
    let imageView: UIImageView = {
       UIView.build(block: ViewPresets.iconViewModifier)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
