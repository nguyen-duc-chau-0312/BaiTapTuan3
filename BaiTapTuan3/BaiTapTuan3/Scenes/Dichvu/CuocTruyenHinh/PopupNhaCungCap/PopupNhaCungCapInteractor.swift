//
//  PopupNhaCungCapInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 08/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupNhaCungCap Module Interactor Protocol
protocol PopupNhaCungCapInteractorLogic {
    func fetchDataNhaCungCap(data: String)
}

/// PopupNhaCungCap Module Interactor
final class PopupNhaCungCapInteractor {
    weak var presenter: PopupNhaCungCapPresentationLogic!
    weak var router: PopupNhaCungCapRoutingLogic!
    private var worker: PopupNhaCungCapWorkerLogic

    let myData = JSONData()
    var listTruyenHinh: [ServiceTruyenHinhObj] = []
    
    required init(withWorker worker: PopupNhaCungCapWorkerLogic) {
        self.worker = worker
    }
}

extension PopupNhaCungCapInteractor: PopupNhaCungCapInteractorLogic, TruyenHinhServiceImpl {
    
    func fetchDataNhaCungCap(data: String) {
        let result = createListCell()
        presenter.showListCellCity(listCellNhaCungCap: result)
    }
    
    func getDataNuocService(data: [ServiceTruyenHinhObj]) {
        self.listTruyenHinh = data
    }
    
    func createListCell() -> [ServiceTruyenHinhObj] {
        myData.delegateTruyenHinh = self
        myData.getDataListTruyenHinhSerivce()
        return listTruyenHinh
    }
    

}

