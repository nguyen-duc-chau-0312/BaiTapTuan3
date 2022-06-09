//
//  Dien.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 02/06/2022.
//

import Foundation
import SwiftyJSON

protocol DienServiceImpl {
    func getDataServiceObj(data: [ServiceDienObj])
}

struct DienObj {
    let des: String
    let version: String
    var listBillService: [BillService]
    
    init(_ json: JSON) {
        self.des = json["Des"].stringValue
        self.version = json["Version"].stringValue
        let list = json["ListBillService"].arrayValue
        self.listBillService = []
        
        for item in list {
            self.listBillService.append(BillService(item))
        }
    }
}

struct BillService {
    let name: String
    var listService: [ServiceDienObj]
    
    init(_ json: JSON) {
        self.name = json["Name"].stringValue
        self.listService = []
        let list = json["Service"].arrayValue
        for item in list {
            self.listService.append(ServiceDienObj(item))
        }
    }
}

struct ServiceDienObj {
    let proCode: String
    let serCode: String
    let serName: String
    let label: String
    let inputTyple: String
    let switchType: String
    let paymentType: String
    let chargeFee: String
    
    init(_ json: JSON) {
        self.proCode = json["ProCode"].stringValue
        self.serCode = json["SerCode"].stringValue
        self.serName = json["SerName"].stringValue
        self.label = json["Lable"].stringValue
        self.inputTyple = json["InputType"].stringValue
        self.switchType = json["SwitchType"].stringValue
        self.paymentType = json["PaymentType"].stringValue
        self.chargeFee = json["ChargeFee"].stringValue
        
    }
}
