//
//  MarketTabBarView.swift
//  MarketList
//
//  Created by Danrlei Ribeiro Azevedo on 24/05/23.
//

import SwiftUI
import RealmSwift

struct MarketTabBarView: View {
    @State var selectedTab = 0

    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray4
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AddShoppingView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Adicionar")
                }
            
            ListShoppingView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Lista de compras")
                }
        }
    }
}

struct MarketTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MarketTabBarView()
    }
}
