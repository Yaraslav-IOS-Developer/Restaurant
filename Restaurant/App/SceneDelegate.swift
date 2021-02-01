//
//  SceneDelegate.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var orderTabBarItem: UITabBarItem!
    var window: UIWindow?
    
    @objc func updateOrderBadge() {
        let meals = NetworkManagerMenuController.shared.order.menuItem.count
        orderTabBarItem.badgeValue = meals == 0 ? nil : "\(meals)"
    }
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateOrderBadge),
            name: NetworkManagerMenuController.orderUpdateNotification,
            object: nil)
        
        orderTabBarItem = (window?.rootViewController as? UITabBarController)?.viewControllers?.last?.tabBarItem
    }
    
}

