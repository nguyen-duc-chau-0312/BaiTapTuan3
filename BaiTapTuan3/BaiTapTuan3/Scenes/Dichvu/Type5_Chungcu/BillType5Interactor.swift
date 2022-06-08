//
//  BillType5Interactor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// BillType5 Module Interactor Protocol
protocol BillType5InteractorLogic {
    
}

/// BillType5 Module Interactor
final class BillType5Interactor {
    weak var presenter: BillType5PresentationLogic!
    weak var router: BillType5RoutingLogic!
    private var worker: BillType5WorkerLogic
    
    required init(withWorker worker: BillType5WorkerLogic) {
        self.worker = worker
    }
}

extension BillType5Interactor: BillType5InteractorLogic {

}

