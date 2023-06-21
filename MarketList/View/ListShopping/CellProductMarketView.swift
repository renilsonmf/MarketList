//
//  CellProductMarketView.swift
//  MarketList
//
//  Created by Danrlei Ribeiro Azevedo on 24/05/23.
//

import SwiftUI

struct CellProductMarketView: View {
    @State var isChecked = false
    @State var image: String = "Unchecked"
	var name: String
	var quantity: Int
    var id: String
    private var updateItem: (String, Int, Bool, String) -> Void

    init(name: String, quantity: Int, isChecked: Bool, id: String, updateItem: @escaping (String, Int, Bool, String) -> Void) {
		self.name = name
		self.quantity = quantity
        self.isChecked = isChecked
        self.updateItem = updateItem
        self.id = id
	}

    var body: some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: 6
            ) {
                Text(name)
                    .fontWeight(.bold)
                Text("\(quantity) unidades")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: action) {
                Image(isChecked ? "Checked" : "Unchecked")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding()
        .background(Color(hex: "#F5F5F5"))
        .cornerRadius(5)
    }

    func action() {
        isChecked.toggle()
        image = isChecked ? "Checked" : "Unchecked"
        updateItem(name, quantity, isChecked, id)
    }
}

struct CellProductMarketView_Previews: PreviewProvider {
    static var previews: some View {
        CellProductMarketView(name: "Renilson", quantity: 5, isChecked: true, id: "") { _, _, _,_  in}
            .previewLayout(.sizeThatFits)
    }
}
