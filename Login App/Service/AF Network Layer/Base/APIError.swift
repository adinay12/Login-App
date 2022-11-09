//
//  APIError.swift
//  Login App
//
//  Created by Adinay on 15/10/22.
//

import Foundation

enum APIError: Error {
    case notFound
    case serverTroubleShooting
    case unautuhorized
    case badData
}

extension APIError {
    var localozedError: String {
        switch self {
        case .notFound:
            return "Server not Found! 404"
        case .serverTroubleShooting:
            return "Server is on maintaining! 500+"
        case .unautuhorized:
            return "Unathorized"
        case .badData:
            return "Can't parse Data From Server"
        }
    }
}
