//
//  CustomModalEditView.swift
//  MarketList
//
//  Created by Danrlei Ribeiro Azevedo on 14/06/23.
//

import SwiftUI

struct CustomModalEditView: View {
    @State var name: String = ""
    @State var quantity: Int = 0
    @State var showAlertDelete = false
    var id: String
    private var updateItem: (String, Int, Bool, String) -> Void
    private var deleteItem: (String) -> Void
     
    init(name: String,
         quantity: Int,
         id: String,
         updateItem: @escaping (String, Int, Bool, String) -> Void,
         deleteItem: @escaping (String) -> Void) {
        self.name = name
        self.quantity = quantity
        self.id = id
        self.updateItem = updateItem
        self.deleteItem = deleteItem
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            Text("title_modal".localized)
                .font(Font.custom("Roboto-Medium", size: 14))
                .foregroundColor(Color(hex: "#9A9C9E"))
            TextField(name, text: $name)
                .padding()
                .background(Color(hex: "#F5F5F5"))
                .cornerRadius(5)
            Stepper(value: $quantity, in: 0...100) {
                Text("\("quantity".localized): \(quantity)")
                    .font(Font.custom("Roboto-Medium", size: 16))
                    .foregroundColor(Color(hex: "#9A9C9E"))
                }
            
            Spacer()
            
            HStack {
                Button(action: {showAlertDelete = true}) {
                    Text("delete".localized)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "#BE6161"))
                        .cornerRadius(5)
                        .foregroundColor(Color.white)
                }

                Spacer()

                Button(action: didTapSave) {
                    Text("save".localized)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "#7584F2"))
                        .cornerRadius(5)
                        .foregroundColor(Color.white)
                }
                .alert(isPresented: $showAlertDelete) {
                    Alert(title: Text("\("confirm_delete_item".localized) \(name)?"),
                          primaryButton: .default(Text("Ok")) {
                        didTapDelete()
                    }, secondaryButton: .cancel())
                }
            }
        }
        .padding(EdgeInsets(top: 50, leading: 16, bottom: 16, trailing: 16))
        .background(Color.white)
    }
    
    private func didTapSave() {
        updateItem(name, quantity, false, id)
    }
    
    private func didTapDelete() {
        deleteItem(id)
    }
}

