//
//  HoaDonGiaoThongConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class HoaDonGiaoThongConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> HoaDonGiaoThongViewController {
        
        // MARK: Initialise components.
        let viewController = HoaDonGiaoThongViewController(nibName: "HoaDonGiaoThongViewController", bundle: nil)
        let interactor = HoaDonGiaoThongInteractor(withWorker: HoaDonGiaoThongWorker())
        let router = HoaDonGiaoThongRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
