//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationStack {
            List(appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
        .onAppear(){
            getAppetizers()
        }
    }
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers): // let appetizers -> we are giving a variable name for what we get back here
                    self.appetizers = appetizers // self.appetizers : line 12, = appetizers : line above
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}


#Preview {
    AppetizerListView()
}
