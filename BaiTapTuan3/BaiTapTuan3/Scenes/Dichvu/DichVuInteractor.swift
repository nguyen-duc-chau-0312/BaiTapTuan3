//
//  DichVuInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 03/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// DichVu Module Interactor Protocol
protocol DichVuInteractorLogic {
    
}

/// DichVu Module Interactor
final class DichVuInteractor {
    weak var presenter: DichVuPresentationLogic!
    weak var router: DichVuRoutingLogic!
    private var worker: DichVuWorkerLogic
    
    required init(withWorker worker: DichVuWorkerLogic) {
        self.worker = worker
    }
}

extension DichVuInteractor: DichVuInteractorLogic {

}

