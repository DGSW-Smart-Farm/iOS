//
//  DetailData.swift
//  SmartFarm
//
//  Created by 김부성 on 2021/06/04.
//

import Foundation

// DetailData중 LED를 제외한 값을 받아오는 model
struct DetailJSON: Decodable {
    let status: Int
    let value: Int
}

// LED data 혼자만 다르기 때문에 JSON decode를 위한 struct를 따로 작성
struct LedJSON: Decodable {
    let status: Bool
    let time: Int
}
