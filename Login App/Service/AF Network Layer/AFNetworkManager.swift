//
//  AFNetworkManager.swift
//  Login App
//
//  Created by Adinay on 15/10/22.
//

import Foundation
import Alamofire

protocol AFNetworkManagerProtocol {
    func autorize(email: String, password: String, onSuccess: @escaping (AuthModel) ->Void, onError: @escaping (APIError) ->Void )
}

class AFNetworkManager: AFNetworkManagerProtocol {
    let provider = BaseAPI<APIService>()
    
    func autorize(email: String, password: String, onSuccess: @escaping (AuthModel) ->Void, onError: @escaping (APIError) ->Void ) {  // настраивоем запрос
        provider.getData(target: .autorize(email: email, password: password), response: AuthModel.self) { (response) in
            onSuccess(response)
        } onError: { (error) in
            onError(error)
        }
    }
    
    func refreshToken(refreshToken: String) {
        provider.getData(target: .refreshToken(refreshToken: refreshToken), response: RefreshTokenModel.self) { (response) in
            print("Data: \(response)")
        } onError: { (error) in
            print("Error: \(error)")
        }
    }
    
    func getAllTransactions() {
        provider.getData(target: .getAllTransactions, response: RefreshTokenModel.self) { (response) in
            
        } onError: { (error) in
            
        }

    }
}
