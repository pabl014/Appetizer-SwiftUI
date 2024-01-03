//
//  APError.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 03/01/2024.
//


// file for handling network errors from NetworkManager.swift

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
