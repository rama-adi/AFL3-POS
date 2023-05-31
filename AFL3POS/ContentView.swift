//
//  ContentView.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack{
                Home()
            }.tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            NavigationStack{
                CartView()
            }
            .tabItem {
                Image(systemName: "cart")
                Text("Shopping Cart")
            }
        }.background(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
