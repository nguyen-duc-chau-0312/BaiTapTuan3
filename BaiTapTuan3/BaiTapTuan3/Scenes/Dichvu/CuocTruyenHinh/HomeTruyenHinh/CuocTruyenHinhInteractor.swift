//
//  CuocTruyenHinhInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 08/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// CuocTruyenHinh Module Interactor Protocol
protocol CuocTruyenHinhInteractorLogic {
    
}

/// CuocTruyenHinh Module Interactor
final class CuocTruyenHinhInteractor {
    weak var presenter: CuocTruyenHinhPresentationLogic!
    weak var router: CuocTruyenHinhRoutingLogic!
    private var worker: CuocTruyenHinhWorkerLogic
    
    required init(withWorker worker: CuocTruyenHinhWorkerLogic) {
        self.worker = worker
    }
}

extension CuocTruyenHinhInteractor: CuocTruyenHinhInteractorLogic {

}

