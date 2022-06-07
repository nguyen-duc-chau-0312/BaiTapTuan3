//
//  ChungCuCity.swift
//  BaiTapTuan3
//
//  Created by Nguyen Duc Chau on 02/06/2022.
//

import Foundation
import SwiftyJSON

protocol ChungCuCityImpl {
    func getDataChungCuCity(data: [CityObj])
}

struct ChungCuCity {
    var listChungCu: [CityObj]
    
    init(_ json: JSON) {
        let list = json["ListCity"].arrayValue
        self.listChungCu = []
        for item in list {
            listChungCu.append(CityObj(item))
        }
    }
}

struct CityObj {
    let cityCode: String
    let cityName: String
    let cityNameEN: String
    
    init(_ json: JSON) {
        self.cityCode = json["cityCode"].stringValue
        self.cityName = json["cityName"].stringValue
        self.cityNameEN = json["cityNameEN"].stringValue
    }
}
