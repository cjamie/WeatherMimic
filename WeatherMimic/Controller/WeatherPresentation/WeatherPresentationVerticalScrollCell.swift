//
//  WeatherPresentationVerticalScrollCell.swift
//  WeatherMimic
//
//  Created by Jamie Chu on 9/3/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

fileprivate enum VerticalCells {
    case topGrid //this will have 
    case lengthySentence
    case miscInfo
    case separator(inset: Int) //inset will define how much padding there is in left and right
}

//this will have a vertical collectionview with its own assortment of enums.
// this will need to be able
class WeatherPresentationVerticalScrollCell: UICollectionViewCell {
    static let reuseIdentifier = "WeatherPresentationVerticalScrollCell"
    
    fileprivate var tableSections: [VerticalCells] = []
    
    weak var dataSource: TopGridDataSource?
    
    lazy var verticalCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0 // horizontal spacing betweencells.
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        
        //register cells
        cv.register(WeatherPresentationTopGridCell.self, forCellWithReuseIdentifier: WeatherPresentationTopGridCell.reuseIdentifier)
        
        //register nibs
        cv.register(WeatherPresentationDayInfoCell.nib, forCellWithReuseIdentifier: WeatherPresentationDayInfoCell.reuseIdentifier)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(verticalCV)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableSections(){
        tableSections = [.topGrid,
                         .lengthySentence,
                         .miscInfo,
                         .separator(inset: 1)]
    }
}




extension WeatherPresentationVerticalScrollCell: UICollectionViewDelegate {
    
}

extension WeatherPresentationVerticalScrollCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO:
        
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as? WeatherPresentationTopGridCell else { fatalError("bad cell" ) }
        return cell
    }
}
