//
//  LoginViewModel.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//

import Foundation

class LoginViewModel {
    
    func loginUser(_ email: String?, _ password: String?, completionHandler: @escaping (Bool, String) -> Void) {
        guard let email = email,
        let password = password else {
            return completionHandler(false, "try again")
        }
        
        let result = UserEntity.checkUserCredentials(email: email, password: password)
        if result.0 {
            MedBookUserDefaults.shared.isUserLoggedIn = true
            MedBookUserDefaults.shared.myEmail = email
        }
        completionHandler(result.0, result.1)
    }
}
