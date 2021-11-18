//
//  SceneDelegate.swift
//  HTodo
//
//  Created by Humberto Castro on 08/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = getRootViewController()
        window?.makeKeyAndVisible()
    }
    
    private func getRootViewController() -> UIViewController {
        let rootViewController: UIViewController
        if UserDefaults.standard.bool(forKey: "isOnboardingAppeared") {
            rootViewController = UINavigationController(
                rootViewController: DependencyManager.makeTodoListViewController()
            )
        } else {
            rootViewController = IntroViewController()
        }
        return rootViewController
    }
}

