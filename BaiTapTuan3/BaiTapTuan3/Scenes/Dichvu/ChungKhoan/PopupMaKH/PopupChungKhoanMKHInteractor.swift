//
//  PopupChungKhoanMKHInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupChungKhoanMKH Module Interactor Protocol
protocol PopupChungKhoanMKHInteractorLogic {
    func fetchDataListMaKhangHang(data: String)
}

/// PopupChungKhoanMKH Module Interactor
final class PopupChungKhoanMKHInteractor {
    weak var presenter: PopupChungKhoanMKHPresentationLogic!
    weak var router: PopupChungKhoanMKHRoutingLogic!
    private var worker: PopupChungKhoanMKHWorkerLogic
    let myData = JSONData()
    var listChungKhoan: [ChungKhoanService] = []
    
    required init(withWorker worker: PopupChungKhoanMKHWorkerLogic) {
        self.worker = worker
    }
}

extension PopupChungKhoanMKHInteractor: PopupChungKhoanMKHInteractorLogic, ChungKhoanServiceImpl {
    func fetchDataListMaKhangHang(data: String) {
        let result = createListChungKhoan()
        presenter.showListCellChungKhoan(listCellKH: result)
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

