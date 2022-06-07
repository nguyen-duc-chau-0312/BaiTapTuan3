//
//  BillType5ViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol BillType5PresentationLogic: AnyObject {
    
}

// MARK: View
final class BillType5ViewController: BaseViewController {
    var interactor: BillType5InteractorLogic!
    var router: BillType5RoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch BillType5
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension BillType5ViewController: BillType5PresentationLogic {
    
}
