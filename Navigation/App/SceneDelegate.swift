//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Алексей Колыченков on 06.12.2022.
//

import FacebookCore

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else { return }

        ApplicationDelegate.shared.application(
            UIApplication.shared,
            open: url,
            sourceApplication: nil,
            annotation: [UIApplication.OpenURLOptionsKey.annotation])
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
    
    func createGreetingNC() -> UINavigationController {
        let greetingVC = GreetingViewController()
        greetingVC.tabBarItem = UITabBarItem(title: "О разработчике", image: UIImage(systemName: "person"), tag: 0)

        return UINavigationController(rootViewController: greetingVC)
    }
    
//    func createLoginNC() -> UINavigationController {
//        let loginVC = LogInViewController()
//        loginVC.tabBarItem = UITabBarItem(title: "Проект", image: UIImage(systemName: "newspaper.fill"), tag: 1)
//
//        return UINavigationController(rootViewController: loginVC)
//    }

    func createProfileNC() -> UINavigationController {
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Проект", image: UIImage(systemName: "newspaper.fill"), tag: 1)

        return UINavigationController(rootViewController: profileVC)
    }

    func createTabBar() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createGreetingNC(), createProfileNC()]
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

