//
//  Utlis.swift
//  
//
//  Created by 김부성 on 2021/05/26.
//

import Alamofire
import SwiftyJSON

struct Utils {
    static func request(uri: String, params: String, completion: @escaping (JSON) -> Void) throws {
        let baseURL = "10.80.163.68:8000/v1"
        let url:String = baseURL + uri + params
        var APIError: Error?
        
        var result: JSON!
        AF.request(url).responseJSON {
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
