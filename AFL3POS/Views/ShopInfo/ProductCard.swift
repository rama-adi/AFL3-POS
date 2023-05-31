//
//  ProductCard.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 04/05/23.
//

import SwiftUI

// A swiftUI component to show the product
struct ProductCard: View {
    var product: Product
    var buyClicked: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Rp\(product.price)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
            Spacer()
            Button(action: {
                buyClicked()
            }) {
                Text("BUY")
                    .padding(.all, 10)
                    .padding(.horizontal, 20)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.accentColor)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(50)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.secondary.opacity(0.1))
        )
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Shop.shops[0].products[0]) {
            print("Clicked buy")
        }
    }
}
