//
//  CellProductMarketView.swift
//  MarketList
//
//  Created by Danrlei Ribeiro Azevedo on 24/05/23.
//

import SwiftUI

struct CellProductMarketView: View {
    @Binding var allUncheckedTriggering: Bool
    @State var isChecked: Bool
    @State var image: String = "Unchecked"
    var name: String
    var quantity: Int
    var id: String
    var updateItem: (String, Int, Bool, String) -> Void

    var body: some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: 6
            ) {
                Text(name)
                    .fontWeight(.bold)
                Text(getUnity())
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: action) {
                Image(getImage())
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding()
        .background(isChecked ? Color(hex: "#DADBDC") : Color(hex: "#F5F5F5"))
        .cornerRadius(5)
        .onChange(of: allUncheckedTriggering) { _ in
            isChecked = false
        }
    }

    private func getImage() -> String {
        isChecked ? "Checked" : "Unchecked"
    }

    private func getUnity() -> String {
        quantity > 1 ? "\(quantity) unidades" : "\(quantity) unidade"
    }

    func action() {
        isChecked.toggle()
        image = isChecked ? "Checked" : "Unchecked"
        updateItem(name, quantity, isChecked, id)
    }
}
