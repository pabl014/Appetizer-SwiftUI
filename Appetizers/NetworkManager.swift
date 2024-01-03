//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//

import Foundation

final class NetworkManager {
    
    //singleton:
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() { }
    
    // Sean Allen videos:
    // Swift - Result Type - Cleaner Network Calls: https://www.youtube.com/watch?v=8aPjqLqUEKA
    // Swift Closures: @escaping Explained: https://www.youtube.com/watch?v=xiS5gJOIQxI
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        // (Result<[Appetizer], APError>) -> .success case: returns the array of Appetizers, .failure case: APError
//     it's basically:   enum Result<Success, Failure: Error> {
//                              case success(Success)
//                              case failure(Failure)
//                       }
        
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        // creating network call:
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in // data, response, error are all optionals
            // so we are going to unwrap all those optionals and handle them accordingly:
            
            guard let _ = error else {
                completed(.failure(.unableToComplete)) // (ex. wifi not working)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { //http status code 200 = things went good, there we can handle other status codes such as 404, 500 etc.
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            // we have now good data so we have to decoda that data
            // decoding data:
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
