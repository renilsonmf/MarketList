//
//  ListShoppingView.swift
//  MarketList
//
//  Created by Renilson Moreira on 22/05/23.
//

import Foundation

import SwiftUI

struct ListShoppingView: View {
    var body: some View {
        List {
            CellProductMarketView()
            CellProductMarketView()
            CellProductMarketView()
            CellProductMarketView()
            CellProductMarketView()
        }
    }
}

struct ListShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ListShoppingView()
    }
}
