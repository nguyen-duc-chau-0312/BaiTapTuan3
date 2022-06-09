//
//  PopupNhaCungCapNuocInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupNhaCungCapNuoc Module Interactor Protocol
protocol PopupNhaCungCapNuocInteractorLogic {
    func fetchDataListNhaCungCapNuoc(data: String)
}

/// PopupNhaCungCapNuoc Module Interactor
final class PopupNhaCungCapNuocInteractor {
    weak var presenter: PopupNhaCungCapNuocPresentationLogic!
    weak var router: PopupNhaCungCapNuocRoutingLogic!
    private var worker: PopupNhaCungCapNuocWorkerLogic
    let myData = JSONData()
    var listNuoc: [ServiceNuocObj] = []
    
    required init(withWorker worker: PopupNhaCungCapNuocWorkerLogic) {
        self.worker = worker
    }
}

extension PopupNhaCungCapNuocInteractor: PopupNhaCungCapNuocInteractorLogic, NuocServiceImpl {
    
    func fetchDataListNhaCungCapNuoc(data: String){
        let result = createListNuoc()
        presenter.showListCellNuoc(listCellNhaCungCap: result)
    }
    
    func getDataNuocService(data: [ServiceNuocObj]) {
        listNuoc = data
    }
    
    func createListNuoc() -> [ServiceNuocObj] {
        myData.delegateNuoc = self
        myData.getDataListNuocSerivce()
        return listNuoc
    }

}

