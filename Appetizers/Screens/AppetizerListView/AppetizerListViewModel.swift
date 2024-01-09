//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 03/01/2024.
//

import SwiftUI
//import Observation // https://www.youtube.com/watch?v=EK7SthdWV2w

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        
//        isLoading = true
//        
//        NetworkManager.shared.getAppetizers { result in
//            
//            self.isLoading = false
//            DispatchQueue.main.async { [self] in
//                switch result {
//                    
//                    case .success(let appetizers): // let appetizers -> we are giving a variable name for what we get back here
//                        self.appetizers = appetizers // self.appetizers : major object, = appetizers : line above
//                    
//                    case .failure(let error):
//                        switch error {
//                                
//                            case .invalidURL:
//                                alertItem = AlertContext.invalidURL
//                                
//                            case .invalidResponse:
//                                alertItem = AlertContext.invalidResponse
//                                
//                            case .invalidData:
//                                alertItem = AlertContext.invalidData
//                                
//                            case .unableToComplete:
//                                alertItem = AlertContext.unableToComplete
//                        }
//                }
//            }
//        }
//    }
    
    
    func getAppetizers() {
        
        isLoading = true
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                //if the error from the catch block is of type APError let's do some stuff
                if let apError = error as? APError {
                    
                    switch apError {
                         
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                
                isLoading = false
            }
        }
    }
}
