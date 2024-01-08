//
//  ContentView.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
//                    Image(systemName: "house")
//                    Text("Home")
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
//                    Image(systemName: "person")
//                    Text("Account")
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem {
//                    Image(systemName: "bag")
//                    Text("Order")
                    Label("Order", systemImage: "bag")
                        
                }
                .badge(order.items.count)
            
        }
        .tint(Color.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}
