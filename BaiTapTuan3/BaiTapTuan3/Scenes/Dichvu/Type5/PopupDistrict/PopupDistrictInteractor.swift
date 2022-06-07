//
//  PopupDistrictInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupDistrict Module Interactor Protocol
protocol PopupDistrictInteractorLogic {
    
}

/// PopupDistrict Module Interactor
final class PopupDistrictInteractor {
    weak var presenter: PopupDistrictPresentationLogic!
    weak var router: PopupDistrictRoutingLogic!
    private var worker: PopupDistrictWorkerLogic
    
    required init(withWorker worker: PopupDistrictWorkerLogic) {
        self.worker = worker
    }
}

extension PopupDistrictInteractor: PopupDistrictInteractorLogic {

}

