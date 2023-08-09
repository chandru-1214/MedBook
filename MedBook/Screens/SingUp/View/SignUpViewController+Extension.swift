//
//  SignUpViewController+Extension.swift
//  MedBook
//
//  Created by Chandru M on 08/08/23.
//

import UIKit

//MARK: - UIPickerViewDataSource
extension SignUpViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return signUpViewModel?.allContriesList.count ?? 0
    }
    
}

//MARK: - UIPickerViewDelegate
extension SignUpViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if let countryKey = signUpViewModel?.allContriesList[row],
           let countryModel = signUpViewModel?.allCountresDict[countryKey] {
            return countryModel.country
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enableOrDisableSignUpButton()
    }
    
    
}

//MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordTextField {
            if let text = textField.text,
               text != "" {
                let passwordResult = Utils.checkPassword(text: text)
                
                checkOrUncheckImageView(uppercaseCharacterCheckBox, isChecked: passwordResult.isContainUppercase)
                
                checkOrUncheckImageView(specialCharacterCheckBox, isChecked: passwordResult.isContainSpecialChar)
                
                checkOrUncheckImageView(characterNumberCheckBox, isChecked: passwordResult.checkCount)
                
                isValidPassword = (passwordResult.isContainUppercase && passwordResult.isContainSpecialChar && passwordResult.checkCount)
            } else {
                isValidPassword = false
            }
        }
        
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
    
    /// Method check the inupts are valid or not
    /// - Returns: Return true if it is valid
    func validateInputs() -> Bool {
        if let emailText = emailTextField.text,
           !Utils.isValidEmail(testStr: emailText) {
            return false
        }
        
        if !isValidPassword {
            return false
        }
        
        if pickerView.selectedRow(inComponent: 0) == 0 {
            return false
        }
        
        return true
    }
}


//MARK: - SignUpViewModelDelegate
extension SignUpViewController: SignUpViewModelDelegate {
    
    func refreshCountryListView() {
        pickerView.reloadAllComponents()
    }
}
