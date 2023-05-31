//
//  ShopCard.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 03/05/23.
//

import SwiftUI

struct ShopCard: View {
    var shop: Shop
    
    var body: some View {
        VStack {
            
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.accentColor)
                    Image(systemName: shop.category.icon)
                        .resizable()
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        
                }
                
                Spacer()
            }
            
            HStack {
                VStack(alignment:.leading) {
                    Text(shop.name)
                        .font(.title3)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                    
                    Text(shop.category.categoryText)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            
            
        }
        .padding()
        .background(Color.secondary.opacity(0.2))
        .cornerRadius(12)
    }
}


struct ShopCard_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                ForEach(Shop.shops) { shop in
                    ShopCard(shop: shop)
                }
            }
            .padding(.horizontal)
        }
    }
}
