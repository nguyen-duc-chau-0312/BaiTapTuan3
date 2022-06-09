//
//  PopupChungKhoanNCCInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupChungKhoanNCC Module Interactor Protocol
protocol PopupChungKhoanNCCInteractorLogic {
    func fetchDataListNhaCungCapChungKhoan(data: String)
}

/// PopupChungKhoanNCC Module Interactor
final class PopupChungKhoanNCCInteractor {
    weak var presenter: PopupChungKhoanNCCPresentationLogic!
    weak var router: PopupChungKhoanNCCRoutingLogic!
    private var worker: PopupChungKhoanNCCWorkerLogic
    let myData = JSONData()
    var listChungKhoan: [ChungKhoanService] = []
    
    required init(withWorker worker: PopupChungKhoanNCCWorkerLogic) {
        self.worker = worker
    }
}

extension PopupChungKhoanNCCInteractor: PopupChungKhoanNCCInteractorLogic, ChungKhoanServiceImpl {
  
    func fetchDataListNhaCungCapChungKhoan(data: String) {
        let result = createListChungKhoan()
        presenter.showListCellChungKhoan(listCellNhaCungCap: result)
    }
    
    func getDataServiceObj(data: [ChungKhoanService]) {
        self.listChungKhoan = data
    }
    
    func createListChungKhoan() -> [ChungKhoanService] {
        myData.delegateChungKhoan = self
        myData.getDataListChungKhoanSerivce()
        return listChungKhoan
    }
    
}

