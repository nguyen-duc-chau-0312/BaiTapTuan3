//
//  DataDelegate.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 19/05/2022.
//

import Foundation

protocol DataDelegate {
    
    func getDataAccount(data: [AccountObj])
    func dataProcess(accountArrTT: [AccountObj], accountArrTK: [AccountObj])
    func getUsername(userName: String)
}

extension DataDelegate {
    func getUsername(userName: String){
        print("")
    }
}

