//
//  DichVuConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 03/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class DichVuConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> DichVuViewController {
        
        // MARK: Initialise components.
        let viewController = DichVuViewController(nibName: "DichVuViewController", bundle: nil)
        let interactor = DichVuInteractor(withWorker: DichVuWorker())
        let router = DichVuRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
