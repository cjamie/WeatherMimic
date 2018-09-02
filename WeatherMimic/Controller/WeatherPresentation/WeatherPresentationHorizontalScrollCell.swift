//
//  WeatherPresentationHorizontalScrollCell.swift
//  WeatherMimic
//
//  Created by Admin on 8/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

final class WeatherPresentationHorizontalScrollCell: UICollectionViewCell {
    
    //this will provide the list of items it needs.
    var viewModel: WeatherPresentationViewModelProtocol!
    
    lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0// horizontal spacing betweencells.
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        
        cv.register(WeatherPresentationHeadlineCell.self, forCellWithReuseIdentifier: WeatherPresentationHeadlineCell.reuseIdentifier)
        cv.register(WeatherPresentationTemperatureCell.self, forCellWithReuseIdentifier: WeatherPresentationTemperatureCell.reuseIdentifier)
        cv.register(WeatherPresentationDayInfoCell.nib, forCellWithReuseIdentifier: WeatherPresentationDayInfoCell.reuseIdentifier)
        
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cv)
        cv.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension WeatherPresentationHorizontalScrollCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfAccuweatherCells
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
    }


}

extension WeatherPresentationHorizontalScrollCell: UICollectionViewDelegate {
    
}
