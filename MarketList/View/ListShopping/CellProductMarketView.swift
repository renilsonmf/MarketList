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
    var price: String
    var updateItem: (String, Int, Bool, String, String) -> Void

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
                if !price.isEmpty {
                    Text(price)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            Button(action: action) {
                ZStack {
                    Rectangle()
                        .frame(width: 64, height: 64)
                        .foregroundColor(getColor())

                    Image(getImage())
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 4))
        .background(getColor())
        .cornerRadius(5)
        .onChange(of: allUncheckedTriggering) { _ in
            isChecked = false
        }
    }

    private func getColor() -> Color {
        isChecked ? Color(hex: "#DADBDC") : Color(hex: "#F5F5F5")
    }

    private func getImage() -> String {
        isChecked ? "Checked" : "Unchecked"
    }

    private func getUnity() -> String {
        quantity > 1 ? "\(quantity) \("unity_plural".localized)" : "\(quantity) \("unity_singular".localized)"
    }

    func action() {
        isChecked.toggle()
        image = isChecked ? "Checked" : "Unchecked"
        updateItem(name, quantity, isChecked, id, price)
    }
}
