//
//  PopupBienSoKHInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupBienSoKH Module Interactor Protocol
protocol PopupBienSoKHInteractorLogic {
    
}

/// PopupBienSoKH Module Interactor
final class PopupBienSoKHInteractor {
    weak var presenter: PopupBienSoKHPresentationLogic!
    weak var router: PopupBienSoKHRoutingLogic!
    private var worker: PopupBienSoKHWorkerLogic
    
    required init(withWorker worker: PopupBienSoKHWorkerLogic) {
        self.worker = worker
    }
}

extension PopupBienSoKHInteractor: PopupBienSoKHInteractorLogic {

}

