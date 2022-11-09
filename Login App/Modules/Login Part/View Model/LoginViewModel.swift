//
//  LoginViewModel.swift
//  Login App
//
//  Created by Adinay on 4/10/22.
//

import Foundation

protocol LoginViewModelProtocol {
    var isUserAuthorized: ((Bool)->Void)? {get set} // Замыкание
    func autorizationUser(login: String , password: String)
}

class LoginViewModel: LoginViewModelProtocol {  // Будет отвечать за логику LoginViewController
    
    let networkManager: AFNetworkManagerProtocol
    init(networkManager: AFNetworkManagerProtocol = AFNetworkManager()) {
        self.networkManager = networkManager
    }
    
    // То есть true он авторизован а если false он не авторизован
    
    var isUserAuthorized: ((Bool)->Void)?  // Замыкание
    
    
    func autorizationUser(login: String , password: String){
        
        networkManager.autorize(email: login.lowercased(), password: password.lowercased()) { (response) in
            if let accessToken = response.access, let refreshToken  = response.refresh {
                // Сохранили токены
                DSGenerator.sharedInstance.setAccessToken(accessToken)
                DSGenerator.sharedInstance.setRefreshToken(refreshToken)
                self.isUserAuthorized?(true) // проверка true означает зарегестрировался правильно
            } else {
                self.isUserAuthorized?(false)
            }
        } onError: { (error) in
            self.isUserAuthorized?(false) // проверка false означает зарегестрировался не правильно
        }
    }
}
