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
        UITabBar.appearance().backgroundColor = UIColor(red: 0.962, green: 0.962, blue: 0.962, alpha: 1)
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AddShoppingView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("add")
                }
                .tag(0)
            
            ListShoppingView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("market_list")
                }
                .tag(1)
        }
        .tint(.black)
    }
}

struct MarketTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MarketTabBarView()
    }
}
