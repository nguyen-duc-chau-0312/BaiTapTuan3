//
//  PopupMaKhachHangInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 08/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// PopupMaKhachHang Module Interactor Protocol
protocol PopupMaKhachHangInteractorLogic {
    func fetchDataListMaKhangHang(data: String)
}

/// PopupMaKhachHang Module Interactor
final class PopupMaKhachHangInteractor {
    weak var presenter: PopupMaKhachHangPresentationLogic!
    weak var router: PopupMaKhachHangRoutingLogic!
    private var worker: PopupMaKhachHangWorkerLogic
    let myData = JSONData()
    var listTruyenHinh: [ServiceTruyenHinhObj] = []
    
    required init(withWorker worker: PopupMaKhachHangWorkerLogic) {
        self.worker = worker
    }
}

extension PopupMaKhachHangInteractor: PopupMaKhachHangInteractorLogic, TruyenHinhServiceImpl {
    
    func fetchDataListMaKhangHang(data: String) {
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

