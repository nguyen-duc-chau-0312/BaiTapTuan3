//
//  ChungKhoanInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// ChungKhoan Module Interactor Protocol
protocol ChungKhoanInteractorLogic {
    
}

/// ChungKhoan Module Interactor
final class ChungKhoanInteractor {
    weak var presenter: ChungKhoanPresentationLogic!
    weak var router: ChungKhoanRoutingLogic!
    private var worker: ChungKhoanWorkerLogic
    
    required init(withWorker worker: ChungKhoanWorkerLogic) {
        self.worker = worker
    }
}

extension ChungKhoanInteractor: ChungKhoanInteractorLogic {

}

