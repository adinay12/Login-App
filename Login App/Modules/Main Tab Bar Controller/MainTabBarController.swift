//
//  MainTabBarController.swift
//  Login App
//
//  Created by Adinay on 6/10/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.delegate = self
        setupViewControllers()
        setupTabBarAppearance()

        
    }
    
    func setupTabBarAppearance(){
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor =  UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 0.6)  // покрасили цвет tabBara
        self.tabBar.unselectedItemTintColor = UIColor(red: 0.231, green: 0.239, blue: 0.31, alpha: 0.6)
        
    }
    
    func setupViewControllers() {
        self.setViewControllers([
            setupCurrentViewController(viewControllerType:.main),
            setupCurrentViewController(viewControllerType: .settings),
            setupCurrentViewController(viewControllerType: .plus),
            setupCurrentViewController(viewControllerType: .users),
            setupCurrentViewController(viewControllerType: .analytics)
        ], animated: true)  // массив из Вью Контроллеров
    }
    
    func setupCurrentViewController(viewControllerType: ViewControllerType) -> UIViewController {  // функция для Енума viewControllerType
        let vc = viewControllerType.viewController
        vc.tabBarItem.title = viewControllerType.title
        vc.tabBarItem.image = viewControllerType.unSelectedImage
        vc.tabBarItem.selectedImage = viewControllerType.selectedImage  // активное нажатие
        
        return vc
        
    }
}

//extension MainTabBarController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        let tabBarIndex = tabBarController.viewControllers!.firstIndex(of: viewController)!
//
//        if tabBarIndex == 2 {
//
//            let vc = PlusViewController()
//
//            tabBarController.present(vc, animated: true)
//            return false
//
//        }else{
//
//            return false
//
//        }
//    }
//}
