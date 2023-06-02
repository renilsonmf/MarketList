//
//  ListShoppingView.swift
//  MarketList
//
//  Created by Renilson Moreira on 22/05/23.
//

import SwiftUI

struct ListShoppingView: View {
    
    @Binding var list: [CellProductModel]

    var listView: some View {
        List {
            ForEach(list) { item in
                CellProductMarketView(
                    name: item.name,
                    quantity: item.quantity
                )
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 1, trailing: 16))
            }
			.onDelete(perform: deleteItem)
        }
        .buttonStyle(.plain)
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
        .listStyle(.plain)
    }
    
    var voidView: some View {
        VStack {
            Spacer()
            VoidView()
            Spacer()
        }
    }
    
	var body: some View {
		VStack {
			Text("Lista de compras")
				.frame(maxWidth: .infinity, alignment: .leading)
				.font(Font.custom("Roboto-Bold", size: 36))
				.padding(EdgeInsets(top: 50, leading: 16, bottom: 8, trailing: 16))

			Text("Marque a caixinha dos produtos ao coloca-los no carrinho de compras ou arraste para apagar.")
				.frame(maxWidth: .infinity, alignment: .leading)
				.font(Font.custom("Roboto-Regular", size: 16))
				.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
				.foregroundColor(Color(hex: "#9A9C9E"))
            
            if list.isEmpty {
                voidView
            } else {
                listView
            }
            
			Button(action: cleanList) {
				Text("Limpar lista")
					.foregroundColor(Color.white)
					.frame(maxWidth: .infinity)
			}
			.frame(height: 48)
			.background(Color(hex: "#BE6161"))
			.cornerRadius(5)
			.padding()
			.opacity(list.isEmpty ? 0 : 1)
		}
	}

	func deleteItem(_ index: IndexSet) {
		list.remove(atOffsets: index)
	}

	func cleanList() {
        list.removeAll()
	}
}

struct ListShoppingView_Previews: PreviewProvider {
	static var previews: some View {
        ListShoppingView(list: .constant(listMock))
	}
}
