//
//  NuocInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// Nuoc Module Interactor Protocol
protocol NuocInteractorLogic {
    
}

/// Nuoc Module Interactor
final class NuocInteractor {
    weak var presenter: NuocPresentationLogic!
    weak var router: NuocRoutingLogic!
    private var worker: NuocWorkerLogic
    
    required init(withWorker worker: NuocWorkerLogic) {
        self.worker = worker
    }
}

extension NuocInteractor: NuocInteractorLogic {

}

