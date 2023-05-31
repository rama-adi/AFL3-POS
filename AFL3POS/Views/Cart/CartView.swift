//
//  CartView.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 04/05/23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: Cart
    
    @State private var showInputAlert = false
    @State private var showMessageAlert = false
    @State private var payment = ""
    @State private var message = ""
    
    var body: some View {
        VStack {
            
            ScrollView {
                ShoppingCartList()
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text("Total")
                        .font(.caption)
                    Text("Rp \(totalPrice())")
                        .font(.title)
                }
                Button(action: {
                    showInputAlert = true
                }) {
                    Text("Pay")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }.alert("Payment", isPresented: $showInputAlert) {
                    TextField("Enter payment amount", text: $payment)
                    Button("OK", action: processPayment)
                }
                
            }
            
        }
        .alert(isPresented: $showMessageAlert) {
            Alert(title: Text("Message"), message: Text(message), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("Your cart")
        .padding()
        
        
    }
    
    func processPayment() {
        guard let paymentAmount = Int(payment) else {
            message = "Invalid payment amount. Please enter a valid number."
            showMessageAlert = true
            return
        }
        
        if paymentAmount < totalPrice() {
            message = "Payment is lower than \(totalPrice())."
        } else if paymentAmount == totalPrice() {
            message = "Thank you for your payment."
            cart.resetCart()
        } else {
            let change = paymentAmount - totalPrice()
            message = "Thank you for your payment. Your change is \(change)."
            cart.resetCart()
        }
        
        showMessageAlert = true
    }
    
    func totalPrice() -> Int {
        var total = 0
        
        cart.shoppingCart.forEach({ (shop, carts) in
            carts.forEach({ product, data in
                total += data.amount * data.price
            })
        })
        
        return total
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
