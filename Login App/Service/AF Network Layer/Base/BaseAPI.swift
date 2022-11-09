//
//  BaseAPI.swift
//  Login App
//
//  Created by Adinay on 14/10/22.
//

import Foundation
import Alamofire
import SwiftyJSON


class BaseAPI <T: TargetType> {  // Дженерик
    func getData<M: Codable>(target: T, response: M.Type, onSucces: @escaping((M) -> Void),  onError: @escaping(APIError) -> Void) {  // сам запрос и этот тип <M> будет парситься из Сервера и он должен быть Codable
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters  = buildParameters(task: target.task)
        
        AF.request(target.baseUrl + target.path, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).responseData { (data) in   // получаем datu
            
            if data.error != nil {  // Отлавливаем ошибку
                onError(.notFound)
            }
            
            // Вот здесь нам преходят обьекты
            
            if let statusCode = data.response?.statusCode {
                self.handlesStatusCode(statusCode: statusCode) { (error) in
                    onError(error)  // Проверка статус код
                }
            }
            
            if let data = data.data {
                
                let json = JSON(data)
                print("JSON: \(json)")
                
                self.handleResponseData(result: data) { (data) in
                    onSucces(data)
                } onError: { (error) in
                    onError(error )  // Отлавливаем дату и для этого создали функцию handleResponseData
                }
            }
        }
        
    }
    
    private func handleResponseData<K:Codable>(result: Data, onSucces: @escaping (K) -> Void, onError: @escaping (APIError ) -> Void) {
        do {
           let decoder = JSONDecoder()
            let decodedData = try decoder.decode(K.self, from: result)
            onSucces(decodedData)
        } catch {
            onError(.badData)
        }
        
    }
    
    private func handlesStatusCode(statusCode: Int, onError: @escaping (APIError) -> Void) {  // Отлавливаем Ошибки
        switch statusCode {
        case 200..<300: break
        case 300..<400: onError(.serverTroubleShooting)
        case 401: onError(.unautuhorized)
        case 500..<600: onError(.serverTroubleShooting )
        default: break
        }
        
    }
    
   private func buildParameters(task: Task) -> ([String: Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(let parameters, let encoding):
            return (parameters, encoding)   // Возвращаем наши параметры
        case .requestCompositeParameters(let bodyParameters, let bodyEncoding, let queryParameters):
            return ([:], URLEncoding.default) 
        }
    }
}
