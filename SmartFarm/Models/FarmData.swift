//
//  FarmData.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/26.
//
import SwiftyJSON

struct FarmData {
    var humidity: JSONValue
    var temperature: JSONValue
    var light: JSONValue
    
//    init(humidity: JSONValue? = nil, temperature: JSONValue? = nil, light: JSONValue? = nil) {
//        self.humidity = humidity
//        self.temperature = temperature
//        self.light = light
//    }
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
