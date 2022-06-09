//
//  ChungKhoan.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 09/06/2022.
//
import SwiftyJSON

protocol ChungKhoanServiceImpl {
    func getDataServiceObj(data: [ChungKhoanService])
}

struct ChungKhoanObj {
    var listBill: [BillChungKhoanService]
    
    init(_ json: JSON) {
        let list = json["ListBillService"].arrayValue
        self.listBill = []
        for item in list {
            self.listBill.append(BillChungKhoanService(item))
        }
    }
}

struct BillChungKhoanService {
    let name: String
    var listProvider: [Provider]
    
    init(_ json: JSON) {
        self.name = json["Name"].stringValue
        self.listProvider = []
        let list = json["Provider"].arrayValue
        for item in list {
            self.listProvider.append(Provider(item))
        }
    }
}

struct Provider{
    let proCode: String
    let proName: String
    var listChungKhoanService: [ChungKhoanService]
    
    init(_ json: JSON) {
        self.proCode = json["ProCode"].stringValue
        self.proName = json["ProName"].stringValue
        self.listChungKhoanService = []
        let list = json["Service"].arrayValue
        for item in list {
            self.listChungKhoanService.append(ChungKhoanService(item))
        }
    }
}

struct ChungKhoanService {
    let serCode: String
    let serName: String
    let inputType: String
    let lable: String
    let switchType: String
    let paymentType: String
    let chargeFee: String
    
    init(_ json: JSON) {
        self.serCode = json["SerCode"].stringValue
        self.serName = json["SerName"].stringValue
        self.inputType = json["InputType"].stringValue
        self.lable = json["Lable"].stringValue
        self.switchType = json["SwitchType"].stringValue
        self.paymentType = json["PaymentType"].stringValue
        self.chargeFee = json["ChargeFee"].stringValue
    }
}
