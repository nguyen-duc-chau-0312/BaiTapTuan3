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
    func fetchDataListCity(data: String)
}

/// PoupCityBuilding Module Interactor
final class PoupCityBuildingInteractor {
    weak var presenter: PoupCityBuildingPresentationLogic!
    weak var router: PoupCityBuildingRoutingLogic!
    private var worker: PoupCityBuildingWorkerLogic
    let myData = JSONData()
    var listCity: [CityObj] = []
    
    required init(withWorker worker: PoupCityBuildingWorkerLogic) {
        self.worker = worker
    }
}

extension PoupCityBuildingInteractor: PoupCityBuildingInteractorLogic, ChungCuCityImpl {
    
    func fetchDataListCity(data: String) {
        let result = createListCell()
        presenter.showListCellCity(listCellBill: result)
    }
    
    func getDataChungCuCity(data: [CityObj]) {
        for item in data {
            self.listCity.append(item)
        }
    }
    
    func createListCell() -> [CityObj] {
        myData.delegateChungCuCity = self
        myData.getDataListChungCuCity()
        return listCity
    }
    

}

