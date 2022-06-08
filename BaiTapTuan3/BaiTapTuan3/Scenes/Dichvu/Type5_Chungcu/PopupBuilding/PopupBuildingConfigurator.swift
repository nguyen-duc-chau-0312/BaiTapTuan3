//
//  PopupBuildingConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class PopupBuildingConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> PopupBuildingViewController {
        
        // MARK: Initialise components.
        let viewController = PopupBuildingViewController(nibName: "PopupBuildingViewController", bundle: nil)
        let interactor = PopupBuildingInteractor(withWorker: PopupBuildingWorker())
        let router = PopupBuildingRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
