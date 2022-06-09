//
//  PopupMaKhachHangDienInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 09/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupMaKhachHangDien Module Interactor Protocol
protocol PopupMaKhachHangDienInteractorLogic {
    func fetchDataListMaKhangHang(data: String)
}

/// PopupMaKhachHangDien Module Interactor
final class PopupMaKhachHangDienInteractor {
    weak var presenter: PopupMaKhachHangDienPresentationLogic!
    weak var router: PopupMaKhachHangDienRoutingLogic!
    private var worker: PopupMaKhachHangDienWorkerLogic
    let myData = JSONData()
    var listDien: [ServiceDienObj] = []
    
    required init(withWorker worker: PopupMaKhachHangDienWorkerLogic) {
        self.worker = worker
    }
}

extension PopupMaKhachHangDienInteractor: PopupMaKhachHangDienInteractorLogic, DienServiceImpl{
    func fetchDataListMaKhangHang(data: String) {
        let result = createListDien()
        presenter.showListCellDien(listCellKH: result)
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

