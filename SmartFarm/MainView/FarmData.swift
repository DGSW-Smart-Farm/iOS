//
//  FarmData.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/05/26.
//
import SwiftyJSON

struct AllDataResponse: Decodable {
    var humidity_gnd: Data1
    var humidity: Data1
    var temp: Data1
    var led: Data2
    var fertilizer: Data1
    var co2: Data1
}

struct Data1: Decodable {
    var status: Int
    var value: Int?
}

struct Data2: Decodable {
    var status: Bool
    var time: UInt
}

class FarmData {
    let titleArr: [String] = ["수분", "온도", "LED", "카메라"]
    let iconArr: [UIImage] = [UIImage(named: "water icon")!, UIImage(named: "temperature icon")!, UIImage(named: "light icon")!, UIImage(named: "camera icon")!,]
    let imageArr: [UIImage?] = [UIImage(named: "water image"), UIImage(named: "temp image"), UIImage(named: "led image"), nil]
    let colorArr: [UIColor] = [#colorLiteral(red: 0, green: 0.8274509804, blue: 1, alpha: 0.6), #colorLiteral(red: 0.9843137255, green: 0.3725490196, blue: 0.3725490196, alpha: 0.8), #colorLiteral(red: 1, green: 0.3607843137, blue: 0.2235294118, alpha: 0.7), #colorLiteral(red: 0.4156862745, green: 0.3254901961, blue: 0.3058823529, alpha: 0.8)]
    let detailColorArr: [UIColor] = [#colorLiteral(red: 0.4666666667, green: 0.6784313725, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.5294117647, blue: 0.4666666667, alpha: 1), #colorLiteral(red: 1, green: 0.8980392157, blue: 0.4823529412, alpha: 1), #colorLiteral(red: 0.4156862745, green: 0.3254901961, blue: 0.3058823529, alpha: 0.8)]
    var dataArr: [String] = []
}
