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
    var listAccount: [AccountObj]
    var userName: String
    
    init(_ json: JSON) {
        self.totalRecord = json["TotalRecord"].intValue
        self.userName = json["UserName"].stringValue
        let listAcc = json["ListAccount"].arrayValue
        self.accountBankType = json["AccountBankType"].stringValue
        self.listAccount = []
        
        for item in listAcc {
            self.listAccount.append(AccountObj(item))
        }
    }
}


struct AccountObj {
    //Đặt tên struct kèm tiền tố hoặc hậu tố để biết tưởng minh vai trò của struct, ví dụ: AccountObj
    let accountSource: String
    let productCode: String
    let accountMainText: String
    let accountNo: String
    let branch: String
    let accountType: String
    let balance: String
    let balanceAval: String
    let ccy: String
    let accountTypeCode: String
    let openDate: String
    let expireDate: String
    let term: String
    let termType: String
    
    init(_ json: JSON) {
        self.accountSource = json["AccountSource"].stringValue
        self.productCode = json["ProductCode"].stringValue
        self.accountMainText = json["AccountMainText"].stringValue
        self.accountNo = json["AccountNo"].stringValue
        self.branch = json["Branch"].stringValue
        self.accountType = json["AccountType"].stringValue
        self.balance = json["Balance"].stringValue
        self.balanceAval = json["BalanceAval"].stringValue
        self.ccy = json["Ccy"].stringValue
        self.accountTypeCode = json["AccountTypeCode"].stringValue
        self.openDate = json["OpenDate"].stringValue
        self.expireDate = json["ExpireDate"].stringValue
        self.term = json["Term"].stringValue
        self.termType = json["TermType"].stringValue
    }
    //có thể tạo 1 hàm toDict convert từ obj sang dict
}

//extension Encodable {
//    func convertToDictionary() -> [[String: Any]]? {
//        if let data = data(using: .utf8) {
//            do {
//                return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        return nil
//    }
//    
//}

//hoặc tối ưu hơn: tạo extension:
//extension String { //hoặc extension Encodable
//func convertToDictionary() -> [[String: Any]]? {
//    if let data = data(using: .utf8) {
//        do {
//            return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    return nil
//}
//}

struct CellDataModel {
    var title: String
    var label: String
}

//tạo 1 mảng CellDataModel từ accountObj
//cells : [CellDataModel] = [
//    ["title": "số tài khoản", "label": account?.accountNo],
//    ["title": "số dư", "label": account?.balanceAval],
//    ["title": fixed text, "label": account.property],
//    ...
//]
