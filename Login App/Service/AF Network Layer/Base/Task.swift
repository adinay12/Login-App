//
//  Task.swift
//  Login App
//
//  Created by Adinay on 14/10/22.
// Какой формат данных будем отправлять внутри 

import Foundation
import Alamofire

enum Task {
    case  requestPlain  // Нечего не отправляем внутри запроса
    case  requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
    case requestCompositeParameters(bodyParameters: [String: Any], bodyEncoding: ParameterEncoding, queryParameters:[String: Any])
}
