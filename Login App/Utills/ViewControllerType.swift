//
//  ViewControllerType.swift
//  Login App
//
//  Created by Adinay on 6/10/22.
//

import UIKit

enum ViewControllerType {
    case main
    case settings
    case plus
    case users
    case analytics
    
    var viewController: UIViewController { // Возврващаем Вью Контроллеры
        switch self {
        case .main:
            return MainViewController()
        case .settings:
            return SettingsViewController()
        case .plus:
            return PlusViewController()
        case .users:
            return UsersViewController()
        case .analytics:
            return AnalyticsViewController()
        }
    }
    
    var title: String {  // название таб бара
        switch self {
        case .main:
            return "Главная"
        case .settings:
            return "Настройки"
        case .plus:
            return "Плюс"
        case .users:
            return "Пользователи"
        case .analytics:
            return "Аналитика"
        }
    }
    
    var selectedImage: UIImage {  
        switch self {
        case .main:
            return UIImage(named: "Home") ?? UIImage()
        case .settings:
            return UIImage(named: "Settings") ?? UIImage()
        case .plus:
            return UIImage(named: "Plus") ?? UIImage()
        case .users:
            return UIImage(named: "Users") ?? UIImage()
        case .analytics:
            return UIImage(named: "Analytics") ?? UIImage()
        }
    }
    
    var unSelectedImage: UIImage {
        switch self {
        case .main:
            return UIImage(named: "Home") ?? UIImage()
        case .settings:
            return UIImage(named: "Settings") ?? UIImage()
        case .plus:
            return UIImage(named: "Plus") ?? UIImage()
        case .users:
            return UIImage(named: "Users") ?? UIImage()
        case .analytics:
            return UIImage(named: "Analytics") ?? UIImage()
        }
    }
}
