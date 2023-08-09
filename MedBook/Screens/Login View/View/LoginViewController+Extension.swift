//
//  LoginViewController+Extension.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//

import UIKit

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        enableOrDisableSignUpButton()
    }
    
    func enableOrDisableSignUpButton() {
        let enable = validateInputs()
        signUpButtonView.alpha = enable ? 1 :  0.5
        signUpButton.isEnabled = enable
    }
    
    func checkOrUncheckImageView(_ imageView: UIImageView, isChecked: Bool) {
        imageView.image = UIImage(named: isChecked ? "checkbox_icon" : "uncheckbox_icon")!
    }
    
    func validateInputs() -> Bool {
        if let emailText = emailTextField.text,
           !Utils.isValidEmail(testStr: emailText) {
            return false
        }
        
        if let passwordText = passwordTextField.text {
            let passwordResult = Utils.checkPassword(text: passwordText)
            if passwordResult.checkCount && passwordResult.isContainSpecialChar && passwordResult.isContainUppercase {
                return true
            }
        }
        return false
    }
}
