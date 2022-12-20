//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Алексей Колыченков on 06.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = createTabBar()
        window.makeKeyAndVisible()
        
        self.window = window
    }

    
    func creatFeedViewController() -> UINavigationController {
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "newspaper.fill"), tag: 0)
        return feedViewController
    }

//    func creatProfileViewController() -> UINavigationController {
//        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
//        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
//        return profileViewController
//    }
    
    func creatLoginViewController() -> UINavigationController {
        let loginViewController = UINavigationController(rootViewController: LogInViewController())
        loginViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
        loginViewController.navigationBar.isHidden = true
        return loginViewController
    }

    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [creatFeedViewController(), creatLoginViewController()]
        tabBar.tabBar.backgroundColor = .white
        return tabBar
    }

  
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

