//
//  PopupBienSoKHConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class PopupBienSoKHConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> PopupBienSoKHViewController {
        
        // MARK: Initialise components.
        let viewController = PopupBienSoKHViewController(nibName: "PopupBienSoKHViewController", bundle: nil)
        let interactor = PopupBienSoKHInteractor(withWorker: PopupBienSoKHWorker())
        let router = PopupBienSoKHRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
