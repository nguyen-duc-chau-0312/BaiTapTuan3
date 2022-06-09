//
//  PopupBienSoKHViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol PopupBienSoKHPresentationLogic: AnyObject {
}

// MARK: View
final class PopupBienSoKHViewController: UIViewController {
    var interactor: PopupBienSoKHInteractorLogic!
    var router: PopupBienSoKHRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch PopupBienSoKH
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension PopupBienSoKHViewController: PopupBienSoKHPresentationLogic {
    
}
