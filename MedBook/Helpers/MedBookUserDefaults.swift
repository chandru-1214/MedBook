//
//  MedBookUserDefaults.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//

import Foundation

class MedBookUserDefaults {
    static let shared = MedBookUserDefaults()
    
    private let email = "email"
    private let isLoggedIn = "isLoggedIn"
    
    private init() { }
    
    
    var isUserLoggedIn: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: isLoggedIn)
        }
        get {
            return UserDefaults.standard.bool(forKey: isLoggedIn)
        }
    }
    
    var myEmail: String {
        set {
            UserDefaults.standard.set(newValue, forKey: email)
        }
        get {
            return UserDefaults.standard.string(forKey: email) ?? ""
        }
    }
    
}
