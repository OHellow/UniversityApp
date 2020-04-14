//
//  SceneDelegate.swift
//  University
//
//  Created by Satsishur on 10.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let rootNavigationController = UINavigationController()
        var initialVC: UIViewController
        let signedIn = UserDefaults.standard.object(forKey: "SignedIn") as? Bool
        let loggedIn = UserDefaults.standard.object(forKey: "LoggedIn") as? Bool
        if (signedIn == true) && (loggedIn == true) {
            initialVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeVC")
        } else {
            initialVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterLoginViewController")
            //UserDefaults.standard.set(false, forKey: "SignedIn")
        }
        
//        self.window?.rootViewController = rootNavigationController
//        self.window?.makeKeyAndVisible()
//        rootNavigationController.pushViewController(initialVC, animated: false)
        self.window?.rootViewController = UINavigationController(rootViewController: initialVC)
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

