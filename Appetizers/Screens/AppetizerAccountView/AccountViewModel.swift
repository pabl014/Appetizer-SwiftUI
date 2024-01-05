//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 05/01/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    
    @Published var alertItem: AlertItem?
    
    // computed property for checking validation
    var isValidForm: Bool {
        // checking if we have values in all the fields:
        guard !(firstName.isEmpty) && !(lastName.isEmpty) && !(email.isEmpty) else {
            alertItem = AlertContext.invalidForm
            return false
        }
        // checking if we have valid email:
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        print("changes have been saved successfully")
    }
}
