//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Алексей Колыченков on 06.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
//    let feedNavController = UINavigationController(rootViewController: FeedViewController())
//
//    let profileNavController = UINavigationController(rootViewController: ProfileViewController())
//
//    let tabBarController = UITabBarController()
//
//    func createTabBar() -> UITabBarController { tabBarController.setViewControllers([feedNavController, profileNavController], animated: true)
//        return tabBarController
//    }
    
    func creatFeedViewController() -> UINavigationController {
        let feedViewController = UINavigationController(rootViewController: FeedViewController())
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "newspaper.fill"), tag: 0)
        return feedViewController
    }

    func creatProfileViewController() -> UINavigationController {
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
        return profileViewController
    }

    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [creatFeedViewController(), creatProfileViewController()]
        tabBar.tabBar.backgroundColor = .white
        return tabBar
    }
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = createTabBar()
        window.makeKeyAndVisible()
        
        self.window = window
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

