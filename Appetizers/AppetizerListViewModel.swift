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
    var alertItem: AlertItem?
    
    func getAppetizers() {
        
        NetworkManager.shared.getAppetizers { result in
            
            DispatchQueue.main.async { [self] in
                
                switch result {
                    
                    case .success(let appetizers): // let appetizers -> we are giving a variable name for what we get back here
                        
                        self.appetizers = appetizers // self.appetizers : major object, = appetizers : line above
                        
                    case .failure(let error):
                        
                        switch error {
                            
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                            
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                            
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                            
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
