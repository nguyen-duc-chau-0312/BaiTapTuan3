//
//  ParseJSONData.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 19/05/2022.
//

import Foundation
import SwiftyJSON

class JSONData {
    
    var delegateData: DataDelegate?
    var accountArr: [Acount] = []
    var accountArrTT: [Acount] = []
    var accountArrTK: [Acount] = []
    var accountBankType: String = ""
    
    func getDataJSON(){
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let myData = MyData(JSON(rawValue: jsonResult) ?? "")
                let temp = myData.encryptStr.listAccount
                let encrypt = myData.encryptStr.accountBankType
                delegateData?.getData(data: encrypt)
                
                for account in temp {
                    self.accountArr.append(account)
                }
                
            } catch{
                print(error)
                
            }
        }
        delegateData?.getDataAccount(data: accountArr)
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
    
    func getData(data: String) {
        self.accountBankType = data
        delegateData?.getData(data: accountBankType)
    }
    
}

