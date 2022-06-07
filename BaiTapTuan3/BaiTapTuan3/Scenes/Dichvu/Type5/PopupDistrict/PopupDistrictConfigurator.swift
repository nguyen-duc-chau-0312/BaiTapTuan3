//
//  PopupDistrictConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class PopupDistrictConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> PopupDistrictViewController {
        
        // MARK: Initialise components.
        let viewController = PopupDistrictViewController(nibName: "PopupDistrictViewController", bundle: nil)
        let interactor = PopupDistrictInteractor(withWorker: PopupDistrictWorker())
        let router = PopupDistrictRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
