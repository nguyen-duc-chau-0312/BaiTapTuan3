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
    var delegateBill: BillPaymentImpl?
    var delegateChungCuBuild: ChungCuBuildingImpl?
    var delegateChungCuCity: ChungCuCityImpl?
    var delegateChungCuDistrict: ChungCuDistrictImpl?
    var delegateTruyenHinh: TruyenHinhServiceImpl?
    var delegateDien: DienServiceImpl?
    var delegateNuoc: NuocServiceImpl?
    var listNuocService: [ServiceNuocObj] = []
    var listTruyenHinhService: [ServiceTruyenHinhObj] = []
    var listDienService: [ServiceDienObj] = []
    var listDistrict: [DistrictObj] = []
    var listChungCuCity: [CityObj] = []
    var listChungCuBuild: [BuildingObj] = []
    var accountArr: [AccountObj] = []
    var accountArrTT: [AccountObj] = []
    var accountArrTK: [AccountObj] = []
    var listBill: [BillPayment] = []
    var listChungKhoan: [ChungKhoanService] = []
    var delegateChungKhoan: ChungKhoanServiceImpl?
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
//                print("Gia tri: \(bill.des)")
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
    
    func getDataListChungCuBuilding() {
        if let path = Bundle.main.path(forResource: "chungCuBuilding", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let chungcu = ChungCuBuilding(JSON(rawValue: jsonResult) ?? "")
                let temp = chungcu.listBuilding

                for item in temp {
                    self.listChungCuBuild.append(item)
                }
                
            } catch{
                print(error)
                
            }
        }
        delegateChungCuBuild?.getDataChungCuBuild(data: listChungCuBuild)
    }
    
    func getDataListChungCuCity() {
        if let path = Bundle.main.path(forResource: "chungCuCity", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let chungcu = ChungCuCity(JSON(rawValue: jsonResult) ?? "")
                let temp = chungcu.listChungCu

                for item in temp {
                    self.listChungCuCity.append(item)
                }
                
            } catch{
                print(error)
                
            }
        }
        delegateChungCuCity?.getDataChungCuCity(data: listChungCuCity)
    }
    
    func getDataListChungCuDistrict() {
        if let path = Bundle.main.path(forResource: "chungCuDistrict", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let chungcu = ChungCuDistrict(JSON(rawValue: jsonResult) ?? "")
                let temp = chungcu.listDistrict

                for item in temp {
                    self.listDistrict.append(item)
                }
                
            } catch{
                print(error)
                
            }
        }
        delegateChungCuDistrict?.getDataChungCuDistrict(data: listDistrict)
    }
    
    func getDataListDienSerivce() {
        if let path = Bundle.main.path(forResource: "dataDien", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let dien = DienObj(JSON(rawValue: jsonResult) ?? "")
                let temp = dien.listBillService

                for item in temp {
                    for i in item.listService {
                        self.listDienService.append(i)
                    }
                }
                
            } catch{
                print(error)
                
            }
        }
        delegateDien?.getDataServiceObj(data: listDienService)
    }
    
    func getDataListNuocSerivce() {
        if let path = Bundle.main.path(forResource: "dataNuoc", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let nuoc = NuocObj(JSON(rawValue: jsonResult) ?? "")
                let temp = nuoc.listBillService

                for item in temp {
                    for i in item.listService {
                        self.listNuocService.append(i)
                    }
                }
                
            } catch{
                print(error)
                
            }
        }
        delegateNuoc?.getDataNuocService(data: listNuocService)
    }
    
    func getDataListTruyenHinhSerivce() {
        if let path = Bundle.main.path(forResource: "dataTruyenHinh", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let truyenHinh = TruyenHinh(JSON(rawValue: jsonResult) ?? "")
                let temp = truyenHinh.listBillService

                for item in temp {
                    for i in item.listService {
                        self.listTruyenHinhService.append(i)
                    }
                }
                
            } catch{
                print(error)
                
            }
        }
        delegateTruyenHinh?.getDataNuocService(data: listTruyenHinhService)
    }
    
    func getDataListChungKhoanSerivce() {
        if let path = Bundle.main.path(forResource: "dataChungkhoan", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let chungKhoan = ChungKhoanObj(JSON(rawValue: jsonResult) ?? "")
                let temp = chungKhoan.listBill

                for item in temp {
                    for i in item.listProvider {
                        for j in i.listChungKhoanService {
                            self.listChungKhoan.append(j)
                        }
                    }
                }
                
            } catch{
                print(error)
                
            }
        }
        delegateChungKhoan?.getDataServiceObj(data: listChungKhoan)
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

