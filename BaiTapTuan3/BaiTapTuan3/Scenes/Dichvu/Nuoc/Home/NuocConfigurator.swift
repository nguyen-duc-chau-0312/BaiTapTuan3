//
//  NuocConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class NuocConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> NuocViewController {
        
        // MARK: Initialise components.
        let viewController = NuocViewController(nibName: "NuocViewController", bundle: nil)
        let interactor = NuocInteractor(withWorker: NuocWorker())
        let router = NuocRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
