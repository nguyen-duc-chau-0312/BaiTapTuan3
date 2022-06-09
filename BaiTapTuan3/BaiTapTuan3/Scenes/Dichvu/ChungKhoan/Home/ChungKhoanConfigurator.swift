//
//  ChungKhoanConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class ChungKhoanConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> ChungKhoanViewController {
        
        // MARK: Initialise components.
        let viewController = ChungKhoanViewController(nibName: "ChungKhoanViewController", bundle: nil)
        let interactor = ChungKhoanInteractor(withWorker: ChungKhoanWorker())
        let router = ChungKhoanRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
