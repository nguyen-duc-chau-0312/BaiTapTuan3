//
//  PopupDistrictViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupDistrictPresentationLogic: AnyObject {
    
}

// MARK: View
final class PopupDistrictViewController: BaseViewController {
    var interactor: PopupDistrictInteractorLogic!
    var router: PopupDistrictRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch PopupDistrict
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension PopupDistrictViewController: PopupDistrictPresentationLogic {
    
}
