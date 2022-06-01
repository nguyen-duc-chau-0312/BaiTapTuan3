//
//  ParseJSONData.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 19/05/2022.
//

import Foundation
import SwiftyJSON

protocol BillPaymentImpl{
    func getDataBill(data: [BillPayment])
}

class JSONData {
    
    var delegateData: DataDelegate?
    var delegateBill: BillPaymentImpl?
    var accountArr: [AccountObj] = []
    var accountArrTT: [AccountObj] = []
    var accountArrTK: [AccountObj] = []
    var listBill: [BillPayment] = []
    var accountBankType: String = ""
    var userName: String = ""
    
    func getDataJSON(){
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let myData = MyData(JSON(rawValue: jsonResult) ?? "")
                let temp = myData.encryptStr.listAccount
                userName = myData.encryptStr.userName
                delegateData?.getUsername(userName: userName)
                
                for account in temp {
                    self.accountArr.append(account)
                }
                
            } catch{
                print(error)
                
            }
        }
        
        delegateData?.getDataAccount(data: accountArr)
    }
    
    func getDataListBill() {
        if let path = Bundle.main.path(forResource: "ListBill", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let bill = Billobj(JSON(rawValue: jsonResult) ?? "")
                print("Gia tri: \(bill.des)")
                let temp = bill.listBill

                for item in temp {
                    self.listBill.append(item)
                }
                
            } catch{
                print(error)
                
            }
        }
        delegateBill?.getDataBill(data: listBill)
    }
    
    func dataParseProcess() {
        for account in accountArr {
            if (account.accountTypeCode == "2XX") {
                self.accountArrTT.append(account)
            } else if (account.accountTypeCode == "4XX") {
                self.accountArrTK.append(account)
            }
        }
        
        delegateData?.dataProcess(accountArrTT: accountArrTT, accountArrTK: accountArrTK)
        
    }
    
//    func getDataUsername() {
//        delegateData?.getUsername(userName: userName)
//    }
    
}

