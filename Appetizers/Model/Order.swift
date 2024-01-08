//
//  Order.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 08/01/2024.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        // go through entire array and add as you go through all the prices up to one total.
        items.reduce(0) {$0 + $1.price}
        // items.reduce(0) -> our accumulator is ) at start
        // $0 -> accumulator
        // $1 -> current value in array
        // $0 + $1.price -> we are addint current value inside array to accumulator
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(at offesets: IndexSet){
        items.remove(atOffsets: offesets)
    }
}

