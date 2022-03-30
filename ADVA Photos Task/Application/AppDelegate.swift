//
//  AppDelegate.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 28/03/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootNC = HomeViewController()
        window?.rootViewController = rootNC
        window?.makeKeyAndVisible()
        return true
    }
}
