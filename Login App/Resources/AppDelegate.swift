//
//  AppDelegate.swift
//  Login App
//
//  Created by Adinay on 30/9/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var navController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        // Проверка пользователя на авторизацию
        if (DSGenerator.sharedInstance.getAccessToken()) != nil {
            mainPart()  // пользователь существует
        } else {
            loginPart()  // пользователь не существует 
        }
          
        
        return true
    }
    
    func loginPart() {
        navController(vc: LoginViewController())
        self.window?.rootViewController = navController // Вызываем функцию navController
        transition()
        
    }
    
    func mainPart() {
        navController(vc: MainTabBarController())
        self.window?.rootViewController = navController // Вызываем функцию navController
        transition()
    }
    
    func navController(vc: UIViewController){
        
        navController = UINavigationController(rootViewController:  vc)
        navController.navigationBar.isHidden = true
        
    }
    
    func transition() {
        guard let window = window else {  return }
           
        // Анимация
//        UIView.transition(with: window, duration: 4, options: [.transitionFlipFromTop], animations: nil, completion: nil)
        window .makeKeyAndVisible() // показывает все что мы внего закидуем
    }
}
