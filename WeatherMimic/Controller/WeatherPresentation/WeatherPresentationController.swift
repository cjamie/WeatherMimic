//
//  ViewController.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os.log

protocol WeatherPresentationControllerProtocol: class {
    func refreshUI()
}

final class WeatherPresentationController: UIViewController {

    //TODO: need to flesh out the protocol and data binding
    var viewModel: WeatherPresentationViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.blue
        view.addSubview(cv)
        
        cv.anchor(top: view.topAnchor,
                  leading: view.leadingAnchor,
                  bottom: view.bottomAnchor,
                  trailing: view.trailingAnchor)
        
        self.viewModel = WeatherPresentationViewModel(self)
        
        //TODO /Question : does this make sense to do?
        guard let viewModelClosure = viewModel.handleFetchResult else {return}
        viewModel.networkServices.getWeather(completion: viewModelClosure)
        
    }
    
    //TODO: a lot of this can be abstracted away into presets
    lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       
        //        let height: CGFloat = view.frame.height /
        //        let width: CGFloat = view.frame.width
        //        layout.itemSize = CGSize(width: width, height: height) // this will set the item size fo reach cell.
        
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0// horizontal spacing betweencells.
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        
        //register cells
        cv.register(WeatherPresentationHeadlineCell.self, forCellWithReuseIdentifier: WeatherPresentationHeadlineCell.reuseIdentifier)
        cv.register(WeatherPresentationTemperatureCell.self, forCellWithReuseIdentifier: WeatherPresentationTemperatureCell.reuseIdentifier)
        cv.register(WeatherPresentationHorizontalScrollCell.self, forCellWithReuseIdentifier: WeatherPresentationHorizontalScrollCell.reuseIdentifier)

        //register nibs
        cv.register(WeatherPresentationDayInfoCell.nib, forCellWithReuseIdentifier: WeatherPresentationDayInfoCell.reuseIdentifier)
        return cv
    }()
    
}

extension WeatherPresentationController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item at indexpath \(indexPath) selected")
    }
}

extension WeatherPresentationController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //accessing via subscript.
        guard let section = viewModel.getTableSection(byRow: indexPath.row) else { fatalError() }

        
        let identifier: String
        
        switch section {
        case .headline:
            identifier = WeatherPresentationHeadlineCell.reuseIdentifier
        case .temperature:
            identifier = WeatherPresentationTemperatureCell.reuseIdentifier
        case .dayInfo:
            identifier = WeatherPresentationDayInfoCell.reuseIdentifier
        case .horizontalAccu:
            identifier = WeatherPresentationHorizontalScrollCell.reuseIdentifier
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)


        
        
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    
    private func configureCell(cell: UICollectionViewCell?, indexPath: IndexPath) {
        
        guard let mySection = viewModel.getTableSection(byRow: indexPath.row) else { return }
        
        switch mySection {
        case .headline:
            if let headlineCell = cell as? WeatherPresentationHeadlineCell {
                headlineCell.boxedManager = viewModel.manager
            }
        case .temperature:
            if let temperatureCell = cell as? WeatherPresentationTemperatureCell {
                temperatureCell.boxedManager = viewModel.manager
            }
        case .dayInfo:
            if let dayInfoCell = cell as? WeatherPresentationDayInfoCell {
                dayInfoCell.boxedManager = viewModel.manager
            }
        case .horizontalAccu:
            if let horizontalCell = cell as? WeatherPresentationHorizontalScrollCell {
                horizontalCell.boxedManager = viewModel.manager
            }
        }
    }
}

//TODO: update individual cells on a need-based basis.
extension WeatherPresentationController: WeatherPresentationControllerProtocol {
    func refreshUI() {
        cv.reloadData()
    }
}


extension WeatherPresentationController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        guard let mySection = viewModel.getTableSection(byRow: indexPath.row) else {
            os_log("section is still nil so can't calculate height")
            return .zero
        }
        
        let height: CGFloat
        switch mySection {
        case .headline:
            let headlineCell = WeatherPresentationHeadlineCell()
            headlineCell.boxedManager = viewModel.manager
            height = headlineCell.viewHeight
        case .temperature:
            let temperatureCell = WeatherPresentationTemperatureCell()
            temperatureCell.boxedManager = viewModel.manager
            height = temperatureCell.viewHeight
        case .dayInfo:
            if let dayInfoCell = WeatherPresentationDayInfoCell.fromNib {
                dayInfoCell.boxedManager = viewModel.manager
                height = dayInfoCell.viewHeight
            } else {
                height = 0
            }
        case .horizontalAccu:
            height = 150 //
        }
        
        return CGSize(width: view.frame.width, height: height)
    }
}



