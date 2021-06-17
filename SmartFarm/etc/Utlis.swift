//
//  Utlis.swift
//  
//
//  Created by 김부성 on 2021/05/26.
//

import Alamofire
import SwiftyJSON

struct Utils {
    static func request(uri: String, completion: @escaping (AFError?, Data?) -> Void) {
        let baseURL = "http://10.80.163.68:8000/v1"
        let url:String = baseURL + uri
        
        AF.request(url, method: .get).responseData {
            switch $0.result {
            case .success(let value):
                completion(nil, value)
            case .failure(let error):
                completion(error, nil)
            }
        }
    }
}

class DetailViewData {
    static let shared = DetailViewData()
    
    var index: Int = 0
    var name: String = ""
    var color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var subname: String = ""
    
    private init() {}
}

extension String {
    mutating func led() -> String {
        switch self {
        case "true":
            return "켜짐"
        case "false":
            return "꺼짐"
        default:
            return "에러"
        }
    }
}

extension Int {
    mutating func mainName() -> String {
        switch self {
        case 0:
            return "수분"
        case 1:
            return "온도"
        case 2:
            return "LED"
        case 3:
            return "카메라"
        default:
            return "에러"
        }
    }
    mutating func subName() -> String {
        switch self {
        case 0:
            return "물주기"
        case 1:
            return ""
        case 2:
            return "LED"
        case 3:
            return ""
        default:
            return "에러"
        }
    }
}
