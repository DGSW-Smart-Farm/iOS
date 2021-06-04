//
//  Utlis.swift
//  
//
//  Created by 김부성 on 2021/05/26.
//

import Alamofire
import SwiftyJSON

struct Utils {
    static func request(uri: String, completion: @escaping (JSON) -> Void) throws {
        let baseURL = "http://10.80.163.68:8000/v1"
        let url:String = baseURL + uri
        var APIError: Error?
        
        var result: JSON!
        AF.request(url, method: .get).responseJSON {
            switch $0.result {
            case .success(let value):
                result = JSON(value)
                completion(result)
            case .failure(let error):
                APIError = error
            }
        }
        if APIError != nil {
            throw APIError!
        }
    }
}

class DetailViewName {
    static let shared = DetailViewName()
    
    var name: String = ""
    var color: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var subname: String = ""
    
    private init() {}
}

extension Int {
    mutating func indexName() -> String {
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
}
