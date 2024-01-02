//
//  Appetizer.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//

import Foundation


// mirroring the structure of the json: https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers

struct AppetizerResponse {
    let request: [Appetizer]
}

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's tasty af",
                                           price: 9.99,
                                           imageURL: "asian-flank-steak.jpg",
                                           calories: 99,
                                           protein: 98,
                                           carbs: 97)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer,]
}
