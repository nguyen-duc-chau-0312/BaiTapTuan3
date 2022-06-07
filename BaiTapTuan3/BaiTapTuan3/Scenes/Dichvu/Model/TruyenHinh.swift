//
//  TruyenHinh.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 02/06/2022.
//

import Foundation
import SwiftyJSON
protocol TruyenHinhServiceImpl {
    func getDataNuocService(data: [ServiceTruyenHinhObj])
}

struct TruyenHinh {
    var listBillService: [TruyenHinhService]
    
    init(_ json: JSON) {
        let list = json["ListBillService"].arrayValue
        self.listBillService = []
        
        for item in list {
            self.listBillService.append(TruyenHinhService(item))
        }
    }
}

struct TruyenHinhService {
    let name: String
    var listService: [ServiceTruyenHinhObj]
    
    init(_ json: JSON) {
        self.name = json["Name"].stringValue
        self.listService = []
        let list = json["Service"].arrayValue
        for item in list {
            self.listService.append(ServiceTruyenHinhObj(item))
        }
    }
}

struct ServiceTruyenHinhObj {
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
