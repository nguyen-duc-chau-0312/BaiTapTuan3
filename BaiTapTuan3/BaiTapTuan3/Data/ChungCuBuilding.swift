//
//  ChungCuBuilding.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 02/06/2022.
//

import Foundation
import SwiftyJSON

protocol ChungCuBuildingImpl {
    func getDataChungCuBuild(data: [BuildingObj])
}

struct ChungCuBuilding {
    var listBuilding: [BuildingObj]
    
    init(_ json: JSON) {
        self.listBuilding = []
        let buildingArr = json["ListBuilding"].arrayValue
        
        for item in buildingArr {
            self.listBuilding.append(BuildingObj(item))
        }
    }
    
}

struct BuildingObj {
    let buildingID: String
    let buildingName: String
    let buildingNameEN: String
    let provider: String
    let proCode: String
    let serCode: String
    
    init(_ json: JSON) {
        self.buildingID = json["buildingID"].stringValue
        self.buildingName = json["buildingName"].stringValue
        self.buildingNameEN = json["buildingNameEN"].stringValue
        self.provider = json["Provider"].stringValue
        self.proCode = json["ProCode"].stringValue
        self.serCode = json["SerCode"].stringValue
    }
}
