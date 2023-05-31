//
//  Home.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 03/05/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading) {
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text("UC Walk Shops")
                            .font(.system(size: 18, weight: .semibold))
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                            ForEach(Shop.shops) { shop in
                                NavigationLink(destination: ShopInfo(shop: shop)) {
                                    ShopCard(shop: shop)
                                }
                            }
                        }
                    }
                }.padding()
            }
            .navigationBarTitle("Home")
        }
    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
