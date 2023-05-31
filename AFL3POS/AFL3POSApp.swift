//
//  AFL3POSApp.swift
//  AFL3POS
//
//  Created by Rama Adi Nugraha on 03/05/23.
//

import SwiftUI
import UIKit

@main
struct AFL3POSApp: App {
    var cart = Cart()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cart)
                .onAppear {
                    // correct the transparency bug for Tab bars
                    let tabBarAppearance = UITabBarAppearance()
                    tabBarAppearance.configureWithOpaqueBackground()
                    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                    
                }
        }
    }
}
