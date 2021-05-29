//
//  FarmData.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/26.
//
import SwiftyJSON

struct FarmData {
    let humidity: JSONValue
    let temperature: JSONValue
    let light: JSONValue
}

struct JSONValue {
    var status: Int?
    var value: Int?
    var LEDStatus: Bool?
    var time: Int?
    
    init(status: Int? = nil, value: Int? = nil, LEDStatus: Bool? = nil, time: Int? = nil) {
        self.status = status
        self.value = value
    }
}
