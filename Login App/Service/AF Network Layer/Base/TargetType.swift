//
//  TargetType.swift
//  Login App
//
//  Created by Adinay on 14/10/22.
// Это  Запрос на сервер и разделяем его  на мелкие части

import Foundation
import Alamofire

// Это протокол для запросов,который мы разделили весь наш запрос на его определенные части 
protocol TargetType {
    var baseUrl: String { get }  // Сам сервер
    
    var path: String { get }   //
    
    var method: HTTPMethod { get }  // Что мы хотим от Сервера
     
    var task: Task { get }  // Это скрытые Обькты
    
    var headers: [String: String]?  { get}
}
