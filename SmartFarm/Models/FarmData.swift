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
        var humidityValue = JSONValue()
        var temperatureValue = JSONValue()
        var lightValue = JSONValue()
        
        do{
            let json = try Utils.request(uri: "", params: "")
            humidityValue.status = json["humidity_gnd"]["status"].boolValue
            humidityValue.value = json["humidity_gnd"]["value"].doubleValue
        } catch let error {
            print(error)
        }
        return FarmData(humidity: humidityValue, temperature: temperatureValue, light: lightValue)
    }
}

struct JSONValue {
    var status: Bool?
    var value: Double?
    
    init(status:Bool? = nil, value: Double? = nil) {
        self.status = status
        self.value = value
    }
}
