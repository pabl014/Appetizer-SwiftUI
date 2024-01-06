//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 05/01/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    
    func saveChanges() {
        
        guard isValidForm else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser() {
        // we want to make sure that there is some data in user defaults
        guard let userData = userData else {
            return
        }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData) // (type that you want to convert the data into, and then what data you want to make the user out of
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    // computed property for checking validation
    var isValidForm: Bool {
        // checking if we have values in all the fields:
        guard !(user.firstName.isEmpty) && !(user.lastName.isEmpty) && !(user.email.isEmpty) else {
            alertItem = AlertContext.invalidForm
            return false
        }
        // checking if we have valid email:
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    
}
