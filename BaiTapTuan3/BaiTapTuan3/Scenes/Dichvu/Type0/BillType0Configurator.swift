//
//  BillType0Configurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 03/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

//Danh cho Tien dien, Tien nuoc ... Bill.type = 0

import UIKit

final class BillType0Configurator {
    
    // MARK: Configuration
    class func viewcontroller() -> BillType0ViewController {
        
        // MARK: Initialise components.
        let viewController = BillType0ViewController(nibName: "BillType0ViewController", bundle: nil)
        let interactor = BillType0Interactor(withWorker: BillType0Worker())
        let router = BillType0Router()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
