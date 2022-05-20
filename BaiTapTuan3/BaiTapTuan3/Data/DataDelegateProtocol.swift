//
//  DataDelegate.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 19/05/2022.
//

import Foundation
import SwiftyJSON

protocol DataDelegate {
    
    func getDataAccount(data: [Acount])
    func dataProcess(accountArrTT: [Acount], accountArrTK: [Acount])
    func getData(data: String)
}

extension DataDelegate {
    func getData(data: String){
        print("")
    }
}

