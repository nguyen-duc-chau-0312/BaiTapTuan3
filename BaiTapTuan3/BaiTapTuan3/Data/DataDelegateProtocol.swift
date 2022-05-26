//
//  DataDelegate.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 19/05/2022.
//

import Foundation

protocol DataDelegate {
    
    func getDataAccount(data: [Account])
    func dataProcess(accountArrTT: [Account], accountArrTK: [Account])
    func getUsername(userName: String)
}

extension DataDelegate {
    func getUsername(userName: String){
        print("")
    }
}

