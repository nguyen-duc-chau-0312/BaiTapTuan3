//
//  HoaDonDienConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 08/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class HoaDonDienConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> HoaDonDienViewController {
        
        // MARK: Initialise components.
        let viewController = HoaDonDienViewController(nibName: "HoaDonDienViewController", bundle: nil)
        let interactor = HoaDonDienInteractor(withWorker: HoaDonDienWorker())
        let router = HoaDonDienRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
