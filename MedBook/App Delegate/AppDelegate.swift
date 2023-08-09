//
//  AppDelegate.swift
//  MedBook
//
//  Created by Chandru M on 08/08/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIUtils.showIntialViewController()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        CoreDataManager.shared.saveContext()
    }

}

