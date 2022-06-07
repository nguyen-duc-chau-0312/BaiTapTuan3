//
//  PoupCityBuildingInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PoupCityBuilding Module Interactor Protocol
protocol PoupCityBuildingInteractorLogic {
    
}

/// PoupCityBuilding Module Interactor
final class PoupCityBuildingInteractor {
    weak var presenter: PoupCityBuildingPresentationLogic!
    weak var router: PoupCityBuildingRoutingLogic!
    private var worker: PoupCityBuildingWorkerLogic
    
    required init(withWorker worker: PoupCityBuildingWorkerLogic) {
        self.worker = worker
    }
}

extension PoupCityBuildingInteractor: PoupCityBuildingInteractorLogic {

}

