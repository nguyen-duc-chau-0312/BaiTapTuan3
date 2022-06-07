//
//  BillType0ViewController.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 03/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol BillType0PresentationLogic: AnyObject {
    
}

// MARK: View
final class BillType0ViewController: BaseViewController {
    var interactor: BillType0InteractorLogic!
    var router: BillType0RoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch BillType0
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension BillType0ViewController: BillType0PresentationLogic {
    
}
