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

	init(name: String, quantity: Int) {
		self.name = name
		self.quantity = quantity
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
                Image(image)
            }
        }
        .padding()
        .background(Color(hex: "#F5F5F5"))
        .cornerRadius(5)
    }

    func action() {
        isChecked.toggle()
        image = isChecked ? "Checked" : "Unchecked"
    }
}

struct CellProductMarketView_Previews: PreviewProvider {
    static var previews: some View {
		CellProductMarketView(name: "Renilson", quantity: 5)
            .previewLayout(.sizeThatFits)
    }
}
