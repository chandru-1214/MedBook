//
//  UIUtils.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//


import UIKit

class UIUtils {
    
    /// Method to set intial viewcontroller based on user logging state
    static func showIntialViewController() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if let viewController = appDelegate.window?.rootViewController, viewController is UINavigationController {
            let navigationController = viewController as! UINavigationController
            
            if MedBookUserDefaults.shared.isUserLoggedIn {
                let homeViewController = getViewControllerInstance(viewControllerIdentifier: homeViewControllerIdentifier, onStoryboard: mainStoryboard)
                navigationController.viewControllers = [homeViewController]

            } else {
                let landingViewController = getViewControllerInstance(viewControllerIdentifier: landingViewControllerIdentifier, onStoryboard: mainStoryboard)
                navigationController.viewControllers = [landingViewController]
            }
            appDelegate.window?.rootViewController = navigationController
        }
        
    }
    
    //MARK: - ViewController Instance
    static func getViewControllerInstance(viewControllerIdentifier: String, onStoryboard storyboardName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as UIViewController
    }
}
