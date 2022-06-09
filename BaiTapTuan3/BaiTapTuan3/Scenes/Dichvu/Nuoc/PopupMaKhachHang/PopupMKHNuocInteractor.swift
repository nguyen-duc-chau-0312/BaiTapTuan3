//
//  PopupMKHNuocInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupMKHNuoc Module Interactor Protocol
protocol PopupMKHNuocInteractorLogic {
    func fetchDataListMaKhangHangNuoc(data: String)
}

/// PopupMKHNuoc Module Interactor
final class PopupMKHNuocInteractor {
    weak var presenter: PopupMKHNuocPresentationLogic!
    weak var router: PopupMKHNuocRoutingLogic!
    private var worker: PopupMKHNuocWorkerLogic
    let myData = JSONData()
    var listNuoc: [ServiceNuocObj] = []
    
    required init(withWorker worker: PopupMKHNuocWorkerLogic) {
        self.worker = worker
    }
}

extension PopupMKHNuocInteractor: PopupMKHNuocInteractorLogic, NuocServiceImpl {
    func fetchDataListMaKhangHangNuoc(data: String) {
        let result = createListNuoc()
        presenter.showListCellNuoc(listCellKH: result)
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

