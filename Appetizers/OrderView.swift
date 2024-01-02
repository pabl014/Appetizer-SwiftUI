//
//  OrderView.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        
        NavigationStack {
            Text("OrderView")
                .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    OrderView()
}