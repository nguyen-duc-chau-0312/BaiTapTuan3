//
//  PopupNhaCungCapDienInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupNhaCungCapDien Module Interactor Protocol
protocol PopupNhaCungCapDienInteractorLogic {
    func fetchDataListNhaCungCapDien(data: String)
}

/// PopupNhaCungCapDien Module Interactor
final class PopupNhaCungCapDienInteractor {
    weak var presenter: PopupNhaCungCapDienPresentationLogic!
    weak var router: PopupNhaCungCapDienRoutingLogic!
    private var worker: PopupNhaCungCapDienWorkerLogic
    let myData = JSONData()
    var listDien: [ServiceDienObj] = []
    
    required init(withWorker worker: PopupNhaCungCapDienWorkerLogic) {
        self.worker = worker
    }
}

extension PopupNhaCungCapDienInteractor: PopupNhaCungCapDienInteractorLogic, DienServiceImpl {
    
    func fetchDataListNhaCungCapDien(data: String) {
        let result = createListDien()
        presenter.showListCellDien(listCellNhaCungCap: result)
    }
    
    func getDataServiceObj(data: [ServiceDienObj]) {
        self.listDien = data
    }
    
    func createListDien() -> [ServiceDienObj] {
        myData.delegateDien = self
        myData.getDataListDienSerivce()
        return listDien
    }
    

}

