//
//  Product.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 03/05/23.
//

import Foundation

// struct for storing products.
// it conforms to identifiable so that we can do foreach loop.
struct Product: Identifiable {
    var id: Int
    var name: String
    var price: Int
}
