//
//  ShopCategory.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 03/05/23.
//

import Foundation


// Simple category enum
// To show what categories are supported on this app.
enum ShopCategory {
    case ConveinienceStore
    case Cafe
    case Restaurant
    case Stationery
    case CoworkingSpace
    
    var categoryText: String {
        switch self {
        case .ConveinienceStore:
            return "Conveinience Store"
        case .Cafe:
            return "Cafe"
        case .Restaurant:
            return "Restaurant"
        case .Stationery:
            return "Stationery"
        case .CoworkingSpace:
            return "Co-Working Space"
        }
    }
    
    
    var icon: String {
        switch self {
        case .ConveinienceStore:
            return "basket"
        case .Cafe:
            return "cup.and.saucer"
        case .Restaurant:
            return "fork.knife"
        case .Stationery:
            return "books.vertical.fill"
        case .CoworkingSpace:
            return "building.2.fill"
        }
    }
}
