//
//  ShopInfo.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 03/05/23.
//

import SwiftUI


// SwiftUI Component for displaying the shop data
struct ShopInfo: View {
    
    // need to define a shop for this view
    var shop: Shop
    
    
    // State for the sheet
    @State private var selectedProduct: Product?
    @State private var showCartSheet: Bool = false
    
    var body: some View {
        ScrollView {
            
            
            
            VStack(alignment: .leading, spacing: 30) {
                
                VStack(alignment: .leading) {
                    Text("Category")
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        Image(systemName: shop.category.icon)
                            .resizable()
                            .foregroundColor(.accentColor)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        Text(shop.category.categoryText)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Product Sold")
                        .font(.system(size: 18, weight: .semibold))
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(shop.products) { product in
                            ProductCard(product: product) {
                                selectedProduct = product
                                showCartSheet = true
                            }
                        }
                    }
                }
                
                
            }
            .navigationTitle(shop.name)
            .padding()
        }.sheet(isPresented: $showCartSheet) {
            // Sheet is used to display the cart adding inline
            AddToCartSheet(
                isPresented: $showCartSheet,
                selectedShop: shop,
                selectedProduct: $selectedProduct
            )
        }
    }
}

struct ShopInfo_Previews: PreviewProvider {
    static var previews: some View {
        ShopInfo(shop: Shop.shops[0])
    }
}
