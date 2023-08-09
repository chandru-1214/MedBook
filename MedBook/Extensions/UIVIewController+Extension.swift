//
//  UIVIewController+Extension.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//

import UIKit


extension UIViewController {
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)

    }
}
