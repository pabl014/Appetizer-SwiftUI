//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 10/01/2024.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        return Calendar.current.date(byAdding: .year, value: -18 , to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date {
        return Calendar.current.date(byAdding: .year, value: -110 , to: Date())!
    }
}
