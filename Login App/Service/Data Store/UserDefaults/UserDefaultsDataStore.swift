//
//  UserDefaultsDataStore.swift
//  Login App
//
//  Created by Adinay on 17/10/22.
//

import Foundation

protocol UserDefaultsDataStoreProtocol {
    func setAccessToken(_ token: String?)
    func getAccessToken() -> String?
    
    func setRefreshToken(_ token: String?)
    func getRefreshToken() -> String?
    
    func removeAll()
}


