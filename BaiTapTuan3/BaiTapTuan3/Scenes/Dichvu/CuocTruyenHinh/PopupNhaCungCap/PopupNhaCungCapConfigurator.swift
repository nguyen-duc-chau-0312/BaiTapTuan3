//
//  PopupNhaCungCapConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 08/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class PopupNhaCungCapConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> PopupNhaCungCapViewController {
        
        // MARK: Initialise components.
        let viewController = PopupNhaCungCapViewController(nibName: "PopupNhaCungCapViewController", bundle: nil)
        let interactor = PopupNhaCungCapInteractor(withWorker: PopupNhaCungCapWorker())
        let router = PopupNhaCungCapRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
