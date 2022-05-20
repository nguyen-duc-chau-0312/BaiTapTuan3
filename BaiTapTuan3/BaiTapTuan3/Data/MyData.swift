//
//  MyDât.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 18/05/2022.
//

import Foundation
import SwiftyJSON

struct MyData {
    
    let responseID: String
    let resCode: String
    let encryptStr: Encrypt
    
    init(_ json: JSON) {
        self.resCode = json["ResCode"].stringValue
        self.responseID = json["ResponseID"].stringValue
        self.encryptStr = Encrypt(json["EncryptStr"])
        
    }
}

struct Encrypt {
    let totalRecord: Int
    let accountBankType: String
    var listAccount: [Acount]
    var userName: String
    
    init(_ json: JSON) {
        self.totalRecord = json["TotalRecord"].intValue
        let listAcc = json["ListAccount"].arrayValue
        self.accountBankType = json["AccountBankType"].stringValue
        self.listAccount = []
        self.userName = json["UserName"].stringValue
        
        for item in listAcc {
            self.listAccount.append(Acount(item))
        }
    }
}

struct Acount {
    let accountSource: String
    let productCode: String
    let accountMainText: String
    let accountNo: String
    let accountType: String
    let balance: String
    let balanceAval: String
    let ccy: String
    let accountTypeCode: String
    let openDate: String
    let expireDate: String
    
    init(_ json: JSON) {
        self.accountSource = json["AccountSource"].stringValue
        self.productCode = json["ProductCode"].stringValue
        self.accountMainText = json["AccountMainText"].stringValue
        self.accountNo = json["AccountNo"].stringValue
        self.accountType = json["AccountType"].stringValue
        self.balance = json["Balance"].stringValue
        self.balanceAval = json["BalanceAval"].stringValue
        self.ccy = json["Ccy"].stringValue
        self.accountTypeCode = json["AccountTypeCode"].stringValue
        self.openDate = json["OpenDate"].stringValue
        self.expireDate = json["ExpireDate"].stringValue
    }
    
}
