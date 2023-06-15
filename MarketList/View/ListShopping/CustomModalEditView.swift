//
//  CustomModalEditView.swift
//  MarketList
//
//  Created by Danrlei Ribeiro Azevedo on 14/06/23.
//

import SwiftUI

struct CustomModalEditView: View {
    @Binding var item: CellProductObject

    var body: some View {
        VStack(spacing: 10) {
            Text("Informe os novos valores para editar esse item")
                .font(Font.custom("Roboto-Bold", size: 20))
            TextField("\(item.name)", text: $item.name)
                .padding()
                .background(Color(hex: "#F5F5F5"))
                .cornerRadius(5)
            Stepper(value: $item.quantity, in: 0...100) {
                    Text("Quantidade = \(item.quantity)")
                    .font(Font.custom("Roboto-Medium", size: 16))
                    .foregroundColor(Color(hex: "#9A9C9E"))
                }

            HStack {
                Button(action: {}) {
                    Text("Salvar")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(Color.white)
                }

                Spacer()
                
                Button(action: {}) {
                    Text("Excluir")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(5)
                        .foregroundColor(Color.white)
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}

