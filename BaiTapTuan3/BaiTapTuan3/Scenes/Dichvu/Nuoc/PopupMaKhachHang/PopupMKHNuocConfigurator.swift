//
//  PopupMKHNuocConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class PopupMKHNuocConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> PopupMKHNuocViewController {
        
        // MARK: Initialise components.
        let viewController = PopupMKHNuocViewController(nibName: "PopupMKHNuocViewController", bundle: nil)
        let interactor = PopupMKHNuocInteractor(withWorker: PopupMKHNuocWorker())
        let router = PopupMKHNuocRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
