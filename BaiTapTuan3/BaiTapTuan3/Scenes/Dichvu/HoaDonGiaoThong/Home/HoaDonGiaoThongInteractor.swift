//
//  HoaDonGiaoThongInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// HoaDonGiaoThong Module Interactor Protocol
protocol HoaDonGiaoThongInteractorLogic {
    
}

/// HoaDonGiaoThong Module Interactor
final class HoaDonGiaoThongInteractor {
    weak var presenter: HoaDonGiaoThongPresentationLogic!
    weak var router: HoaDonGiaoThongRoutingLogic!
    private var worker: HoaDonGiaoThongWorkerLogic
    
    required init(withWorker worker: HoaDonGiaoThongWorkerLogic) {
        self.worker = worker
    }
}

extension HoaDonGiaoThongInteractor: HoaDonGiaoThongInteractorLogic {

}

