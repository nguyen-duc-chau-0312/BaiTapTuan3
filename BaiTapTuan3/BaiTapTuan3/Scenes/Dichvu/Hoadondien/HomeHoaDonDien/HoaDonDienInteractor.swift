//
//  HoaDonDienInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 08/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// HoaDonDien Module Interactor Protocol
protocol HoaDonDienInteractorLogic {
    
}

/// HoaDonDien Module Interactor
final class HoaDonDienInteractor {
    weak var presenter: HoaDonDienPresentationLogic!
    weak var router: HoaDonDienRoutingLogic!
    private var worker: HoaDonDienWorkerLogic
    
    required init(withWorker worker: HoaDonDienWorkerLogic) {
        self.worker = worker
    }
}

extension HoaDonDienInteractor: HoaDonDienInteractorLogic {

}

