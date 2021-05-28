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

    static func requestData() -> FarmData {
        var humidityValue: JSONValue = JSONValue()
        var temperatureValue: JSONValue = JSONValue()
        var lightValue: JSONValue = JSONValue()
        
        do{
            let json = try Utils.request(uri: "", params: "")
            humidityValue.status = json["humidity_gnd"]["status"].intValue
            humidityValue.value = json["humidity_gnd"]["value"].intValue
            temperatureValue.status = json["temp"]["status"].intValue
            temperatureValue.value = json["temp"]["value"].intValue
            lightValue.LEDStatus = json["led"]["status"].boolValue
            lightValue.time = json["led"]["time"].intValue
        } catch let error {
            print(error)
        }
        return FarmData(humidity: humidityValue, temperature: temperatureValue, light: lightValue)
    }
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
