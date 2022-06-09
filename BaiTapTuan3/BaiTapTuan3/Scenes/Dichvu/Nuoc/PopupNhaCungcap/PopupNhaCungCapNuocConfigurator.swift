//
//  PopupNhaCungCapNuocConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class PopupNhaCungCapNuocConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> PopupNhaCungCapNuocViewController {
        
        // MARK: Initialise components.
        let viewController = PopupNhaCungCapNuocViewController(nibName: "PopupNhaCungCapNuocViewController", bundle: nil)
        let interactor = PopupNhaCungCapNuocInteractor(withWorker: PopupNhaCungCapNuocWorker())
        let router = PopupNhaCungCapNuocRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
