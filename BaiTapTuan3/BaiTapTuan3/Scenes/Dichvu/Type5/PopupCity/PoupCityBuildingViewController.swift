//
//  PoupCityBuildingViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PoupCityBuildingPresentationLogic: AnyObject {
    
}

// MARK: View
final class PoupCityBuildingViewController: BaseViewController {
    var interactor: PoupCityBuildingInteractorLogic!
    var router: PoupCityBuildingRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch PoupCityBuilding
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension PoupCityBuildingViewController: PoupCityBuildingPresentationLogic {
    
}
