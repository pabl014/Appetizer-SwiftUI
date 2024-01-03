//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//

import SwiftUI

struct AppetizerListView: View {

    var viewModel = AppetizerListViewModel()
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
        .onAppear(){
            viewModel.getAppetizers()
        }
    }
}


#Preview {
    AppetizerListView()
}
