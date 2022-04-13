//
//  AppDelegate.swift
//  Banking
//
//  Created by Nilesh Kumar on 12/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .gray
        window?.rootViewController = OnboardingViewController()
        return true
    }


}

