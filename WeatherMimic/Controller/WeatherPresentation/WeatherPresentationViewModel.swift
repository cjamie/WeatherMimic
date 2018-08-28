//
//  WeatherPresentationViewModel.swift
//  WeatherMimic
//
//  Created by Admin on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum PresentationCells {
    case headline
}

protocol WeatherPresentationViewModelProtocol: class, WeatherFetching {
    var manager: WeatherMimicManager? { get set } //TODO: put this inside of a box.
    
    var tempManager: Box<WeatherMimicManager?> { get }
    
    var delegate: WeatherPresentationControllerProtocol? { get set }
    var handleFetchResult: WeatherForecastHandler? { get set }
    var numberOfSections: Int { get }
    
    func getTableSection(byRow row: Int) -> PresentationCells?
    func changeTableSections(to newSections: [PresentationCells]?)
}

//this will be a class because we are maintaining the tableSections
final class WeatherPresentationViewModel: WeatherPresentationViewModelProtocol {
    
    var tempManager: Box<WeatherMimicManager?> = Box(nil)
    
    var delegate: WeatherPresentationControllerProtocol?
    var tableSections: Box<[PresentationCells]?> //we don't want caller to have direct access to this.
    let networkServices: NetworkCommunicator
    
    init(_ controller: WeatherPresentationControllerProtocol) {
        self.delegate = controller
        
        let initialSections: [PresentationCells] = [.headline]
        tableSections = Box(initialSections)
        
        tableSections.bind{ print("this was updated to \($0)") }
        self.networkServices = NetworkCommunicator()
        
        
        //we have an oportunity to pass inour didSet logic inside of here
        tempManager.bind { _ in
            DispatchQueue.main.async {
                [weak self] in
                self?.delegate?.refreshUI()
            }
        }
        
    }
    
    //Helper functions

    //MARK: WeatherPresentationViewModelProtocol

    var numberOfSections: Int {
        return tableSections.value?.count ?? 0
    }
    
    //this will be instantiated when service returns a response.
    //TODO: should this be binded to update a specific element?
    var manager: WeatherMimicManager? {
        didSet {
            DispatchQueue.main.async {
                [weak self] in
                self?.delegate?.refreshUI()
            }
        }
    }
    
    func getTableSection(byRow row: Int) -> PresentationCells? {
        return tableSections.value?[row]
    }

    func changeTableSections(to newSections: [PresentationCells]?) {
        self.tableSections.value = newSections
    }

    // Once you receive a successful response, then you can create your Manager instance
    lazy var handleFetchResult: WeatherForecastHandler? = {
        [weak self] fetchResult in
        print("handling the fetch result ")
        switch fetchResult {
        case .failure(let err):
            //TODO: handle error cases in UI
            print(err.localizedDescription)
        case .success(let forecastInstance):
            self?.manager = WeatherMimicManager(forecast: forecastInstance)
            
            self?.tempManager.value = WeatherMimicManager(forecast: forecastInstance)
            guard let good = self?.manager else {
                print("it is still nil")
                return
            }
            print("setting the manager \(good) \(good.cityName) ")
//            print(forecastInstance) //this is valid.
        }
    }
}
