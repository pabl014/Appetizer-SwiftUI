//
//  User.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 05/01/2024.
//

import Foundation

// we give all variables default values so when we first open account screen it looks properly

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
