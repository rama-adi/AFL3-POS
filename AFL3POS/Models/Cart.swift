//
//  Cart.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 04/05/23.
//

import Foundation
import SwiftUI

class Cart: ObservableObject {
    typealias shoppingCartType = [ String: [ String: (price: Int, amount: Int) ] ]
    @Published var shoppingCart: shoppingCartType = [:]
    
    func resetCart() {
        shoppingCart = [:]
    }
    
    func addToShoppingCart(shop: Shop, product: Product, amount: Int) {
        
        // do some initialization before we can add to the cart
        if shoppingCart[shop.name] == nil {
            shoppingCart[shop.name] = [:]
        }
        
        
        if shoppingCart[shop.name]![product.name] == nil {
            shoppingCart[shop.name]![product.name] = (
                price: product.price,
                amount: 0
            )
        }
        
        
        // add to the cart after initialization is done
        shoppingCart[shop.name]![product.name] = (
            price: product.price,
            amount: shoppingCart[shop.name]![product.name]!.amount + amount
        )
    }
    
    
}
