//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//


// Sean Allen videos:
// Swift - Result Type - Cleaner Network Calls: https://www.youtube.com/watch?v=8aPjqLqUEKA
// Swift Closures: @escaping Explained: https://www.youtube.com/watch?v=xiS5gJOIQxI

import UIKit

final class NetworkManager {
    
    //singleton:
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>() // key-value pair, our identfier will be a string and at that identifier in the cache is going to be a UIImage
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() { }
    

    
//    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
//        
//        // (Result<[Appetizer], APError>) -> .success case: returns the array of Appetizers, .failure case: APError
////     it's basically:   enum Result<Success, Failure: Error> {
////                              case success(Success)
////                              case failure(Failure)
////                       }
//        
//        guard let url = URL(string: appetizerURL) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        // creating network call:
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in // data, response, error are all optionals
//            // so we are going to unwrap all those optionals and handle them accordingly:
//            
//            if let _ = error { // if error has a value :
//                completed(.failure(.unableToComplete)) // (ex. wifi not working)
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { //http status code 200 = things went good, there we can handle other status codes such as 404, 500 etc.
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            // we have now good data so we have to decoda that data
//            // decoding data:
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            } catch {
//                completed(.failure(.invalidData))
//            }
//        }
//        
//        task.resume()
//    }
    
    
    func getAppetizers() async throws -> [Appetizer] { // throws -> we want to throw an error is sth goes wrong
        
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
//            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//            return decodedResponse.request
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
        
    
    
    // downloading image, we are passing images' url, this network call will return closure that's going to either have a UIImage or nil
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        // if there is image in cache (previously it was downloaded) then take it
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        
        //is sth goes wrong we don't care about the errors so we don't handle response and error
        //(if things go wrong we'll just show placeholder
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            // if i have good data -> great, if i have good data let's try to initialize an image from that data
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            // let's put that image in cache
            self.cache.setObject(image, forKey: cacheKey)
        }
        
        task.resume()
    }
}
