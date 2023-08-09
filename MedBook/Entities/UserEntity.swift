//
//  UserEntity.swift
//  MedBook
//
//  Created by Chandru M on 09/08/23.
//

import Foundation

import CoreData

class UserEntity: NSManagedObject {
    
    static func insertNewUser(email: String, password: String, code: String, countryModel: CountryModel) {
        let userEntity = UserEntity(context: CoreDataManager.getManagedObjectContext())
        userEntity.email = email
        userEntity.password = password
        userEntity.country = countryModel.country
        userEntity.countryCode = code
        userEntity.region = countryModel.region
        CoreDataManager.shared.saveContext()
    }
    
    static func isUserExists(email: String) -> Bool {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        let fetchedList = try? CoreDataManager.getManagedObjectContext().fetch(fetchRequest)
        return (fetchedList != nil && fetchedList!.count > 0)
    }
    
    static func checkUserCredentials(email: String, password: String) -> (Bool, String) {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        if let userEntity = try? CoreDataManager.getManagedObjectContext().fetch(fetchRequest).first {
            if userEntity.password == password {
                return (true, "User Logged in succesfully")
            } else {
               return (false, "Incorrect password")
            }
        } else {
            return (false, "User not exist")
        }
        
    }
}
    
