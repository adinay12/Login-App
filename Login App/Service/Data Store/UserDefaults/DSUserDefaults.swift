//
//  DSUserDefaults.swift
//  Login App
//
//  Created by Adinay on 17/10/22.
//

import UIKit

class DSUserDefaults: UserDefaultsDataStoreProtocol {
    
    // Хранение данных вызвали его Сингл Тон
    
    static let shared = DSUserDefaults()
    
    private  let userDefaults = UserDefaults.standard   // Это сингл тон патерн Одиночка
    
    
    private let pAccessToken = "AccessToken"
    private let pRefreshToken = "RefreshToken"
    
    func setAccessToken(_ token: String?) {
        userDefaults.set(token, forKey: pAccessToken)
    }
    
    func getAccessToken() -> String? {
        return userDefaults.string(forKey: pAccessToken)
    }
    
    func setRefreshToken(_ token: String?) {
        userDefaults.set(token, forKey: pRefreshToken)
    }
    
    func getRefreshToken() -> String? {
        return userDefaults.string(forKey: pRefreshToken)
    }
    
    // Полное  Удаление данных
    
    func removeAll() {
        userDefaults.removeObject(forKey: pAccessToken)
        userDefaults.removeObject(forKey: pRefreshToken)
    }
    
}
