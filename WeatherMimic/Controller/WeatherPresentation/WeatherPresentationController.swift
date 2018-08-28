//
//  ViewController.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os

typealias NetworkCallHandler = () -> ()

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
        
        addSubviews()
        
        cv.anchor(top: view.topAnchor,
                  leading: view.leadingAnchor,
                  bottom: view.bottomAnchor,
                  trailing: view.trailingAnchor)
        
        print("weather presentation controller ")
        self.viewModel = WeatherPresentationViewModel(self)
        
        print("testing getWeather controller ")
        viewModel.getWeather(completion: viewModel.handleFetchResult!)
        
    }
    
    lazy var cv: UICollectionView = {
        print("creating collectionview")
        let layout = UICollectionViewFlowLayout()
        
        let height: CGFloat = view.frame.height
        let width: CGFloat = view.frame.width
//        layout.itemSize = CGSize(width: width, height: height) // size for item at equivalent
        
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0// horizontal spacing betweencells.
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        
        cv.register(WeatherPresentationHeadlineCell.self, forCellWithReuseIdentifier: WeatherPresentationHeadlineCell.reuseIdentifier)
        return cv
    }()
    
    private func addSubviews() -> () {
        view.addSubview(cv)
    }
}

extension WeatherPresentationController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item at indexpath \(indexPath) selected")
    }
}

extension WeatherPresentationController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell?
        
        //accessing via subscript.
        guard let section = viewModel.getTableSection(byRow: indexPath.row) else {
            fatalError()
        }

        switch section {
        case .headline:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherPresentationHeadlineCell.reuseIdentifier, for: indexPath)
        }
        
        configureCell(cell: cell, indexPath: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    
    private func configureCell(cell: UICollectionViewCell?, indexPath: IndexPath) {
        
        guard let mySection = viewModel.getTableSection(byRow: indexPath.row) else {
            return
        }
        switch mySection {
        case .headline:
            if let headlineCell = cell as? WeatherPresentationHeadlineCell, let viewModelManager = viewModel.manager {
                print("setting the manager now")
                headlineCell.viewModelManager = viewModelManager
            }
        }
    }
}

extension WeatherPresentationController: WeatherPresentationControllerProtocol{
    func refreshUI(){
        print("refreshing UI")
        cv.reloadData()
    }
}


extension WeatherPresentationController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 300)
    }
}



