//
//  ShoppingCartList.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 04/05/23.
//

import SwiftUI

struct ShoppingCartList: View {
    @EnvironmentObject var cart: Cart
    
    var body: some View {
        let sortedShops = cart.shoppingCart.keys.sorted()
        
        ForEach(0..<sortedShops.count, id: \.self) { index in
            let shop = sortedShops[index]
            VStack(alignment: .leading) {
                Text(shop)
                    .font(.headline)
                
                let sortedProducts = cart.shoppingCart[shop]!.keys.sorted()
                ForEach(0..<sortedProducts.count, id: \.self) { productIndex in
                    let product = sortedProducts[productIndex]
                    let item = cart.shoppingCart[shop]![product]!
                    let totalPrice = item.price * item.amount
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(product)
                                .font(.subheadline)
                            Text("Price: \(item.price)")
                                .font(.footnote)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("Total:")
                                .font(.footnote)
                            Text("\(totalPrice)")
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
    }
}

struct ShoppingCartList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartList()
    }
}
