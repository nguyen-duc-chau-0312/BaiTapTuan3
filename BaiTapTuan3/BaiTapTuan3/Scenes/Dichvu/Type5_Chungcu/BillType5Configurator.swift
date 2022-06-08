//
//  BillType5Configurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class BillType5Configurator {
    
    // MARK: Configuration
    class func viewcontroller() -> BillType5ViewController {
        
        // MARK: Initialise components.
        let viewController = BillType5ViewController(nibName: "BillType5ViewController", bundle: nil)
        let interactor = BillType5Interactor(withWorker: BillType5Worker())
        let router = BillType5Router()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
