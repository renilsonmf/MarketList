//
//  ContentView.swift
//  MarketList
//
//  Created by Renilson Moreira on 22/05/23.
//

import SwiftUI
import RealmSwift

struct AddShoppingView: View {
    @State var productNameTextField: String = ""
    @State var productQuantity: Int = 0
	@State var showAlert = false
	@State var titleAlert = ""

    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Image("supermarket")
                .resizable()
                .frame(width: 140, height: 140, alignment: .center)
            Text("Adicionar item a lista de compras")
                .font(Font.custom("Roboto-Bold", size: 20))
            TextField("Digite algo", text: $productNameTextField)
                .padding()
                .background(Color(hex: "#F5F5F5"))
                .cornerRadius(5)
            Stepper(value: $productQuantity, in: 0...100) {
                    Text("Quantidade: \(productQuantity)")
                    .font(Font.custom("Roboto-Medium", size: 16))
                    .foregroundColor(Color(hex: "#9A9C9E"))
                }

            Button(action: didTapSave) {
                Text("Salvar")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
            }
			.alert(isPresented: $showAlert) {
				Alert(title: Text(titleAlert))
			}
            .frame(height: 48)
            .background(Color(hex: "#7584F2"))
            .cornerRadius(5)

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
     //   .onTapGesture {
     //       endTextEditing()
     //   }
    }
    
	private func didTapSave() {
		if productNameTextField.isEmpty || productQuantity == 0 {
			showAlert = true
			titleAlert = "Preencha todos os campos!"
		} else {
            saveItem()
		}
    }

	private func saveItem() {
		do {
			let realm = try Realm()
			let object = CellProductObject()
			object.name = productNameTextField
			object.quantity = productQuantity

			try realm.write {
				realm.add(object)
			}

			titleAlert = "Item adicionado!"
			showAlert = true
            productNameTextField = ""
            productQuantity = 0
		} catch {
			titleAlert = "Ocorreu um erro inesperado ! 😞"
			showAlert = true
			print("Erro ao salvar o objeto: \(error)")
		}
	}
}

struct AddShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingView()
    }
}
