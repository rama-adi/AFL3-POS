//
//  Shop.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 03/05/23.
//

import Foundation

struct Shop: Identifiable {
    var id: Int
    var name: String
    var category: ShopCategory
    var products: [Product]
    
    static let shops: [Shop] = [
        
        Shop(id: 1, name: "Tuku-Tuku", category: .ConveinienceStore, products: [
            Product(id: 1, name: "Kinder Bueno", price: 16000),
            Product(id: 2, name: "Pocky Matcha", price: 12000)
        ]),
        
        Shop(id: 2, name: "Xiang Jia", category: .Restaurant, products: [
            Product(id: 1, name: "Kopi susu es", price: 15000)
        ]),
        Shop(id: 3, name: "Gading Murni", category: .Stationery, products: [
            Product(id: 1, name: "Print Hitam Putih", price: 100)
        ]),
        Shop(id: 4, name: "Dapur Farah", category: .Restaurant, products: [
            Product(id: 1, name: "Nasi Madura", price: 25000)
        ]),
        Shop(id: 5, name: "Raburi", category: .Restaurant, products: [
            Product(id: 1, name: "Ramen", price: 30000)
        ]),
    ]
}
