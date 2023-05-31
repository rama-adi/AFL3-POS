//
//  AddToCartSheet.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 04/05/23.
//

import SwiftUI


// A swiftUI component for adding to cart
struct AddToCartSheet: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var cart: Cart
    
    var selectedShop: Shop
    
    @Binding var selectedProduct: Product?
    @State private var quantity: Int = 1
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    Text(selectedProduct!.name)
                        .font(.title)
                    
                    Text("Rp \(selectedProduct!.price) each")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                }
                
                HStack {
                    HStack {
                        Button(action: {
                            if quantity > 1 {
                                quantity -= 1
                            }
                        }) {
                            Text("-")
                                .font(.title)
                                .foregroundColor(.accentColor)
                                .frame(width: 40, height: 40)
                        }
                        
                        Text("\(quantity)")
                            .font(.body)
                            .frame(minWidth: 60, minHeight: 40)
                        
                        Button(action: {
                            quantity += 1
                        }) {
                            Text("+")
                                .font(.title)
                                .foregroundColor(.accentColor)
                                .frame(width: 40, height: 40)
                        }
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.bottom)
                    
                    Spacer()
                    
                    
                }
                
                
                
                
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    Text("Total: Rp \(selectedProduct!.price * quantity)")
                        .font(.title)
                    Button(action: {
                        
                        cart.addToShoppingCart(
                            shop: selectedShop,
                            product: selectedProduct!,
                            amount: quantity
                        )
                        
                        isPresented = false
                    }) {
                        Text("Add to Cart")
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .navigationTitle("Add to Cart")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Cancel") {
                isPresented = false
            })
        }
    }
    
    
}

struct AddToCartSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartSheet(
            isPresented: .constant(true),
            selectedShop: Shop.shops[0],
            selectedProduct: .constant(Shop.shops[0].products[0])
        )
    }
}
