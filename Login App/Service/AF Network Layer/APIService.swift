//
//  APIService.swift
//  Login App
//
//  Created by Adinay on 15/10/22.
//

import Foundation
import Alamofire

enum APIService {
    case autorize(email: String, password: String)
    case refreshToken(refreshToken: String)
    case getAllTransactions  // запрос для Транзакции
}

// https://neobis-finance-sistem.herokuapp.com/account/api/token/
extension APIService:TargetType {  // Подписываемся под наш Протокол TargetType
    var baseUrl: String {
        return "https://neobis-finance-sistem.herokuapp.com" // это base часть
    }
    
    var path: String {
        switch self {
        case .autorize: return  "/account/api/token/"
        case .refreshToken:
            return "/account/api/token/refresh/"
        case.getAllTransactions:
            return "/transaction/"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case.autorize, .refreshToken: return.post
        default: return.get
        }
    }
    
    var task: Task {
        switch self {
        case .autorize(let email, let pasword):
            let params: [String: Any] = [  // параметры
                "email": email,
                "password": pasword
            ]
            return.requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .refreshToken(let refreshToken):
            let params: [String: Any] = [  // параметры
                "refresh": refreshToken
            ]
            
            return.requestParameters(parameters: params, encoding: URLEncoding.default)
            
        default: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case.getAllTransactions :
            var params = [String: String]()
            if let accessToken = DSGenerator.sharedInstance.getAccessToken() {
                params["Authorization"] = " Bearer \(accessToken)"
            }
            
            return params
        default: return nil
            
        }
    }
}
