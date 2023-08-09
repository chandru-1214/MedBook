//
//  Utils.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//

import Foundation

class Utils {
    
    //MARK: - Email Validation
    static func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    //MARK: - Password Validation
    static func checkPassword(text: String) -> (checkCount: Bool, isContainUppercase: Bool, isContainSpecialChar: Bool) {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalResult = texttest.evaluate(with: text)
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialResult = texttest2.evaluate(with: text)
        
        return (text.count >= 8, capitalResult,specialResult )
    }
    
    
    /// Method to clear logged user details
    static func clearAllUserData() {
        MedBookUserDefaults.shared.isUserLoggedIn = false
        MedBookUserDefaults.shared.myEmail = ""
    }
    
}
