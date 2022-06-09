//
//  PopupChungKhoanNCCConfigurator.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

final class PopupChungKhoanNCCConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> PopupChungKhoanNCCViewController {
        
        // MARK: Initialise components.
        let viewController = PopupChungKhoanNCCViewController(nibName: "PopupChungKhoanNCCViewController", bundle: nil)
        let interactor = PopupChungKhoanNCCInteractor(withWorker: PopupChungKhoanNCCWorker())
        let router = PopupChungKhoanNCCRouter()
        
        // MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
