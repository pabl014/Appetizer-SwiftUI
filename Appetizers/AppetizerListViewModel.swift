//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 03/01/2024.
//

import SwiftUI
import Observation // https://www.youtube.com/watch?v=EK7SthdWV2w

@Observable final class AppetizerListViewModel {
    
    var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers): // let appetizers -> we are giving a variable name for what we get back here
                    self.appetizers = appetizers // self.appetizers : major object, = appetizers : line above
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
