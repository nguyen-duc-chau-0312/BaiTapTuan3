//
//  ChungCuDistrict.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 02/06/2022.
//

import Foundation
import SwiftyJSON

protocol ChungCuDistrictImpl {
    func getDataChungCuDistrict(data: [DistrictObj])
}

struct ChungCuDistrict {
    var listDistrict: [DistrictObj]
    
    init(_ json: JSON) {
        let list = json["ListDistrict"].arrayValue
        self.listDistrict = []
        for item in list {
            listDistrict.append(DistrictObj(item))
        }
    }
}

struct DistrictObj {
    let districtCode: String
    let districtName: String
    let districtNameEN: String
    
    init(_ json: JSON) {
        self.districtCode = json["districtCode"].stringValue
        self.districtName = json["districtName"].stringValue
        self.districtNameEN = json["districtNameEN"].stringValue
    }
}

