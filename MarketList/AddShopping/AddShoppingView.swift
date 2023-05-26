//
//  ContentView.swift
//  MarketList
//
//  Created by Renilson Moreira on 22/05/23.
//

import SwiftUI

struct AddShoppingView: View {
    
    @State var productNameTextField: String = ""
    @State var productQuantity: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Image("supermarket")
                .resizable()
                .frame(width: 110, height: 100, alignment: .center)
            Text("Adicionar item a lista de compras")
                .font(Font.custom("Roboto-Regular", size: 20))
            TextField("Digite algo", text: $productNameTextField)
                .padding()
                .background(Color(hex: "#F5F5F5"))
                .cornerRadius(5)
            Stepper(value: $productQuantity, in: 0...100) {
                    Text("Quantidade = \(productQuantity)")
                }

            Button(action: didTapSave) {
                Text("Salvar")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
            }
            .frame(height: 48)
            .background(Color(hex: "#8EA491"))
            .cornerRadius(5)
            .padding()

        }.padding()
    }
    
    private func didTapSave() {
        print("deu bom")
    }
}

struct AddShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingView()
    }
}
