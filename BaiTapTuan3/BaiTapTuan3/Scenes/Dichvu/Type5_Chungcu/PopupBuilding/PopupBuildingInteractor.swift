//
//  PopupBuildingInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupBuilding Module Interactor Protocol
protocol PopupBuildingInteractorLogic {
    func fetchDataListBuilding(data: String)
}

/// PopupBuilding Module Interactor
final class PopupBuildingInteractor {
    
    weak var presenter: PopupBuildingPresentationLogic!
    weak var router: PopupBuildingRoutingLogic!
    private var worker: PopupBuildingWorkerLogic
    
    let myData = JSONData()
    var listBuilding: [BuildingObj] = []
    
    required init(withWorker worker: PopupBuildingWorkerLogic) {
        self.worker = worker
    }
}

extension PopupBuildingInteractor: PopupBuildingInteractorLogic, ChungCuBuildingImpl {
    
    func fetchDataListBuilding(data: String) {
        let result = createListBuilding()
        presenter.showListCellDistrict(listCellDistrict: result)
    }
    
    func getDataChungCuBuild(data: [BuildingObj]) {
        for item in data {
            self.listBuilding.append(item)
        }
    }
    
   
    
    func createListBuilding() -> [BuildingObj] {
        myData.delegateChungCuBuild = self
        myData.getDataListChungCuBuilding()
        return listBuilding
    }

}

