//
//  CuocTruyenHinhConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 08/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class CuocTruyenHinhConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> CuocTruyenHinhViewController {
        
        // MARK: Initialise components.
        let viewController = CuocTruyenHinhViewController(nibName: "CuocTruyenHinhViewController", bundle: nil)
        let interactor = CuocTruyenHinhInteractor(withWorker: CuocTruyenHinhWorker())
        let router = CuocTruyenHinhRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
