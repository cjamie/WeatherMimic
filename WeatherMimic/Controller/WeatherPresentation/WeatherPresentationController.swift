//
//  ViewController.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import os

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
        
        self.viewModel = WeatherPresentationViewModel(self)
        
        guard let viewModelClosure = viewModel.handleFetchResult else {return}
        viewModel.getWeather(completion: viewModelClosure)
        
    }
    
    //TODO: a lot of this can be abstracted away into presets
    lazy var cv: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let height: CGFloat = view.frame.height
        let width: CGFloat = view.frame.width
        //        layout.itemSize = CGSize(width: width, height: height) // this will set the item size fo reach cell.
        
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
    
    private func addSubviews() {
        view.addSubview(cv)
    }
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
        
        guard let mySection = viewModel.getTableSection(byRow: indexPath.row) else { return }
        
        switch mySection {
        case .headline:
            if let headlineCell = cell as? WeatherPresentationHeadlineCell {
                headlineCell.boxedManager = viewModel.manager
            }
        }
        
    }
}

//TODO: update individual cells on a need based basis.
extension WeatherPresentationController: WeatherPresentationControllerProtocol{
    func refreshUI(){
        print("refreshing UI")
        cv.reloadData()
    }
}


extension WeatherPresentationController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //TODO: dynamically calculate the height.
        return CGSize(width: view.frame.width, height: 300)
    }
}



