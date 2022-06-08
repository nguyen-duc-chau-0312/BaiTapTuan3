//
//  PopupDistrictInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 07/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupDistrict Module Interactor Protocol
protocol PopupDistrictInteractorLogic {
    func fetchDataListDistrict(data: String)
}

/// PopupDistrict Module Interactor
final class PopupDistrictInteractor {
    weak var presenter: PopupDistrictPresentationLogic!
    weak var router: PopupDistrictRoutingLogic!
    private var worker: PopupDistrictWorkerLogic
    
    let myData = JSONData()
    var listDistrict: [DistrictObj] = []
    
    required init(withWorker worker: PopupDistrictWorkerLogic) {
        self.worker = worker
    }
}

extension PopupDistrictInteractor: PopupDistrictInteractorLogic, ChungCuDistrictImpl {
    
    func fetchDataListDistrict(data: String) {
        let result = createListDistrict()
        presenter.showListCellDistrict(listCellDistrict: result)
    }
    
    func getDataChungCuDistrict(data: [DistrictObj]) {
        for item in data {
            self.listDistrict.append(item)
        }
    }
    
    func createListDistrict() -> [DistrictObj] {
        myData.delegateChungCuDistrict = self
        myData.getDataListChungCuDistrict()
        return listDistrict
    }

}

