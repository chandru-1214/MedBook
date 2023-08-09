//
//  SignUpViewModel.swift
//  MedBook
//
//  Created by Chandru M on 08/08/23.
//

import Foundation

protocol SignUpViewModelDelegate: AnyObject {
   func refreshCountryListView()
}

class SignUpViewModel {
    
    //MARK: - Internal Variable
    var allContriesList = [""]
    var allCountresDict:[String: CountryModel] = [:]
    weak var delegate: SignUpViewModelDelegate?
    
    
    /// Method to set and update country list view
    func getCountryList() {
        if let countryModel = loadJson("Countries") {
            
            for (key, value) in countryModel {
                if let countryDetails = value as? [String: String] {
                    let countryObject = CountryModel(country: countryDetails["country"],
                                                     region: countryDetails["region"])
                    allCountresDict[key] = countryObject
                    allContriesList.append(key)
                }
            }
            allContriesList = allContriesList.sorted(by: <)
            delegate?.refreshCountryListView()
        }
    }
    
    /// Method to fetch Json string from json file and map to our custom object
    /// - Parameter fileName: Denotes file name
    /// - Returns: Return dictionary object
    func loadJson(_ fileName: String) -> [String: Any]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any],
                   let countryList = dictionary["data"] as? [String: Any] {
                    return countryList
                }
                return nil
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    /// Method to add new user
    /// - Parameters:
    ///   - email: Denotes email
    ///   - password: Denotes password
    ///   - countryCode: Denotes couuntry code
    ///   - completionHandler: Return true if user added otherwise false
    func addNewUser(email: String?, password: String?, countryCode: String?, completionHandler: @escaping (Bool, String) -> Void) {
        guard let email = email,
              let password = password,
              let countryCode = countryCode,
              let countryModel = allCountresDict[countryCode] else {
            completionHandler(false, "Try again")
            return
        }
        
        if UserEntity.isUserExists(email: email) {
            completionHandler(false, "User alreay exist")
        } else {
            UserEntity.insertNewUser(email: email, password: password, code: countryCode, countryModel: countryModel)
            MedBookUserDefaults.shared.isUserLoggedIn = true
            MedBookUserDefaults.shared.myEmail = email
            completionHandler(true, "user added succesfully")
        }
    }
    
}
