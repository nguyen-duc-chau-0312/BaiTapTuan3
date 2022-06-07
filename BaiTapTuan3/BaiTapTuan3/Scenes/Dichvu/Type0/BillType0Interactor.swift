//
//  BillType0Interactor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 03/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// BillType0 Module Interactor Protocol
protocol BillType0InteractorLogic {
    
}

/// BillType0 Module Interactor
final class BillType0Interactor {
    weak var presenter: BillType0PresentationLogic!
    weak var router: BillType0RoutingLogic!
    private var worker: BillType0WorkerLogic
    
    required init(withWorker worker: BillType0WorkerLogic) {
        self.worker = worker
    }
}

extension BillType0Interactor: BillType0InteractorLogic {

}

