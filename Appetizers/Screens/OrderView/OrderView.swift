//
//  OrderView.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    
    var body: some View {

        NavigationStack {
            ZStack {
                VStack {
                    List {
                        // we don't need to pass an id in ForEach beacuse we conform to Identifiable protocol in Appetizer.swift
                        ForEach(orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        // swipe to delete: chosen item at indexSet index will be deleted
                        .onDelete(perform: { indexSet in
                            deleteItems(at: indexSet)
                        })
                        //.onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order placed")
                    } label: {
                        APButton(title: "$99.99 - Place Order")
                    }
                    .padding(.bottom, 30)
                }
                
                if orderItems.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order. \nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
        
    }
    
    func deleteItems(at offesets: IndexSet){
        orderItems.remove(atOffsets: offesets)
    }
}

#Preview {
    OrderView()
}
