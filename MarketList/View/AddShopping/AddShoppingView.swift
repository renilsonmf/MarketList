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
    @State var productPriceTextField: String = ""
    @State var productQuantity: Int = 1
	@State var showAlert = false
	@State var titleAlert = ""
    @State private var isToastShowing = false

    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                VStack(spacing: 25){
                    Text("add_to_list")
                        .font(Font.custom("Roboto-Bold", size: 20))
                    TextField("type_product_name", text: $productNameTextField)
                        .padding()
                        .background(Color(hex: "#F5F5F5"))
                        .cornerRadius(5)
                }
                .background(.white)
                .onTapGesture {
                    endTextEditing()
                }
                Stepper(value: $productQuantity, in: 1...100) {
                    Text("\("quantity".localized): \(productQuantity)")
                        .font(Font.custom("Roboto-Medium", size: 16))
                        .foregroundColor(Color(hex: "#9A9C9E"))
                    }
                
                HStack {
                    Text("Preço")
                        .font(Font.custom("Roboto-Medium", size: 16))
                        .foregroundColor(Color(hex: "#9A9C9E"))
                    
                    Spacer(minLength: 58)
                    
                    TextField("R$ 0,00", text: $productPriceTextField)
                        .padding()
                        .background(Color(hex: "#F5F5F5"))
                        .cornerRadius(5)
                        .keyboardType(.numberPad)
                }
                
                Button(action: didTapSave) {
                    Text("save")
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
            .padding(EdgeInsets(top: 4, leading: 16, bottom: 16, trailing: 16))

            ToastView(
                isToastShowing: $isToastShowing,
                text: "toast_message".localized,
                color: Color.green
            )
        } // ZStack
    } // View
    
	private func didTapSave() {
		if productNameTextField.isEmpty {
			showAlert = true
            titleAlert = "type_product_name".localized + "!"
		} else {
            isToastShowing = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isToastShowing = false
            }
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
            productNameTextField = ""
            productQuantity = 1
		} catch {
            titleAlert = "error_message".localized
			showAlert = true
		}
	}
}

struct AddShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingView()
    }
}
