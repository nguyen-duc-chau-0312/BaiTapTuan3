//
//  PopupNhaCungCapDienConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class PopupNhaCungCapDienConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> PopupNhaCungCapDienViewController {
        
        // MARK: Initialise components.
        let viewController = PopupNhaCungCapDienViewController(nibName: "PopupNhaCungCapDienViewController", bundle: nil)
        let interactor = PopupNhaCungCapDienInteractor(withWorker: PopupNhaCungCapDienWorker())
        let router = PopupNhaCungCapDienRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
