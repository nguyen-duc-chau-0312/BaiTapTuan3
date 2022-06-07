//
//  DichVuInteractor.swift
//  BaiTapTuan3
//
//  Created Nguyen Duc Chau on 03/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// DichVu Module Interactor Protocol
protocol DichVuInteractorLogic {
    func fetchDataListBill(data: String)
}

/// DichVu Module Interactor
final class DichVuInteractor {
    weak var presenter: DichVuPresentationLogic!
    weak var router: DichVuRoutingLogic!
    private var worker: DichVuWorkerLogic
    let myData = JSONData()
    var listBill: [BillPayment] = []
    
    required init(withWorker worker: DichVuWorkerLogic) {
        self.worker = worker
    }
}

extension DichVuInteractor: DichVuInteractorLogic, BillPaymentImpl {
    func fetchDataListBill(data: String) {
        let result = createListCell()
        
        presenter.showListCellBill(listCellBill: result)
    }
    
    
    func getDataBill(data: [BillPayment]) {
        for item in data {
            self.listBill.append(item)
        }
    }
    
//    func getDataProvider(data: BillPayment) {
//        worker.getListProvider(data.id)
//    }

    
    func createListCell() -> [BillPayment] {
        myData.delegateBill = self
        myData.getDataListBill()
        return listBill
    }
}

