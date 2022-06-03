//
//  DemoInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 03/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// Demo Module Interactor Protocol
protocol DemoInteractorLogic {
    
}

/// Demo Module Interactor
final class DemoInteractor {
    weak var presenter: DemoPresentationLogic!
    weak var router: DemoRoutingLogic!
    private var worker: DemoWorkerLogic
    
    required init(withWorker worker: DemoWorkerLogic) {
        self.worker = worker
    }
}

extension DemoInteractor: DemoInteractorLogic {

}

