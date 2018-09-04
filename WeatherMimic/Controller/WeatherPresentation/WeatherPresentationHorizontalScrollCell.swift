//
//  WeatherPresentationHorizontalScrollCell.swift
//  WeatherMimic
//
//  Created by Admin on 8/29/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

//TODO; wwant ot set self to be a delegate.
final class WeatherPresentationHorizontalScrollCell: UICollectionViewCell {
    static let reuseIdentifier = "WeatherPresentationHorizontalScrollCell"
    
    enum Constants{
        static let layoutItemSize = CGSize(width: 100, height: 150)
    }
    
    //this will provide a method data source, and the count
    var boxedManager: Box<WeatherForecastDataManager?> = Box(nil) {
        didSet {
            boxedManager.bind(closure: dataManagerClosure)
        }
    }
    
    lazy var dataManagerClosure: (WeatherForecastDataManager?)->() = {
        _ in
        self.horizontalCV.reloadData()
    }
    
    lazy var horizontalCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0 // horizontal spacing betweencells.
        layout.itemSize = Constants.layoutItemSize
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = false
        
        cv.register(WeatherPresentationAccuCell.self, forCellWithReuseIdentifier: WeatherPresentationAccuCell.reuseIdentifier)
        cv.backgroundColor = UIColor.yellow
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("adding the horizontalCV to subview")
        addSubview(horizontalCV)
        horizontalCV.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherPresentationHorizontalScrollCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boxedManager.value?.horizontalDataSourceCount ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherPresentationAccuCell.reuseIdentifier, for: indexPath) as? WeatherPresentationAccuCell else {
            fatalError("bad cell")
        }
        let unit = boxedManager.value?.getUnit(at: indexPath)
        cell.boxedManager = Box(unit)
        return cell
    }
}

extension WeatherPresentationHorizontalScrollCell: UICollectionViewDelegate {
    var viewHeight: CGFloat {
        return Constants.layoutItemSize.height
    }
}
