//
//  CustomModalEditView.swift
//  MarketList
//
//  Created by Danrlei Ribeiro Azevedo on 14/06/23.
//

import SwiftUI

struct CustomModalEditView: View {
    @State var item: CellProductObject
    @State var name: String = ""
    @State var quantity: Int = 0
    
    private var updateItem: (CellProductObject) -> Void
     
    init(item: CellProductObject, updateItem: @escaping (CellProductObject) -> Void) {
        self.item = item
        self.updateItem = updateItem
        self.name = item.name
        self.quantity = item.quantity
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Informe os novos valores para editar esse item")
                .font(Font.custom("Roboto-Bold", size: 20))
            TextField(name, text: $name)
                .padding()
                .background(Color(hex: "#F5F5F5"))
                .cornerRadius(5)
            Stepper(value: $quantity, in: 0...100) {
                    Text("Quantidade = \(quantity)")
                    .font(Font.custom("Roboto-Medium", size: 16))
                    .foregroundColor(Color(hex: "#9A9C9E"))
                }

            HStack {
                Button(action: didTapSave) {
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
    
    private func didTapSave() {
        updateItem(item)
    }
}

