//
//  DataListBill.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 01/06/2022.
//

import Foundation
import SwiftyJSON

protocol BillPaymentImpl{
    func getDataBill(data: [BillPayment])
}

struct Billobj {
    let version: String
    let des: String
    var listBill: [BillPayment]
    
    init(_ json: JSON) {
        
        self.version = json["Version"].stringValue
        self.des = json["Des"].stringValue
        let list = json["ListBillPayment"].arrayValue
        self.listBill = []
        
        for i in list {
            self.listBill.append(BillPayment(i))
        }
    }
}

//enum BillType{
//    case 0
//    case 1
//    case 2
//}

struct BillPayment {
    let lable: String
    let id: String
    let name: String
    let img: String
    let type: String
    
    init(_ json: JSON) {
        self.lable = json["Lable"].stringValue
        self.id = json["ID"].stringValue
        self.name = json["Name"].stringValue
        self.img = json["Img"].stringValue
        self.type = json["Type"].stringValue
    }
}

