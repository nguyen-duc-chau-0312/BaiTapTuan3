//
//  PoupCityBuildingConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class PoupCityBuildingConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> PoupCityBuildingViewController {
        
        // MARK: Initialise components.
        let viewController = PoupCityBuildingViewController(nibName: "PoupCityBuildingViewController", bundle: nil)
        let interactor = PoupCityBuildingInteractor(withWorker: PoupCityBuildingWorker())
        let router = PoupCityBuildingRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
