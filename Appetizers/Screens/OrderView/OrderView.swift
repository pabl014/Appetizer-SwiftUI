//
//  OrderView.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    //@State private var orderItems = MockData.orderItems
    
    var body: some View {

        NavigationStack {
            ZStack {
                VStack {
                    List {
                        // we don't need to pass an id in ForEach beacuse we conform to Identifiable protocol in Appetizer.swift
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        // swipe to delete: chosen item at indexSet index will be deleted
                        .onDelete(perform: { indexSet in
                            order.deleteItems(at: indexSet)
                        })
                        //.onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order placed")
                    } label: {
                        APButton(title: "$ \(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 30)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order. \nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
