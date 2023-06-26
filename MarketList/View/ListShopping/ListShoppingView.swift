//
//  ListShoppingView.swift
//  MarketList
//
//  Created by Renilson Moreira on 22/05/23.
//

import SwiftUI
import RealmSwift
import Realm
import Foundation
import SheetKit

struct ListShoppingView: View {
    @ObservedResults(CellProductObject.self) var listViewModel
    @State var showAlert = false
    
    var listView: some View {
        List {
            Section(header:
                Text("Lista de compras")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.custom("Roboto-Bold", size: 36))
                .padding(EdgeInsets(top: 50, leading: 16, bottom: 8, trailing: 16))
                .foregroundColor(Color.black)
            ) {
                Text("Marque a caixinha dos produtos ao colocá-los no carrinho de compras ou clique no item para editar ou excluir.")
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.custom("Roboto-Regular", size: 16))
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .foregroundColor(Color(hex: "#9A9C9E"))
            }
            .listRowSeparator(.hidden)

            ForEach(listViewModel) { item in
                CellProductMarketView(
                    name: item.name,
                    quantity: item.quantity,
                    isChecked: item.isChecked,
                    id: item.id,
                    updateItem: updateProduct
                )
                .onTapGesture {
                    SheetKit().present(with: .bottomSheet) {
                        CustomModalEditView(name: item.name,
                                            quantity: item.quantity,
                                            id: item.id,
                                            updateItem: updateProduct,
                                            deleteItem: deleteItemFromModal)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 1, trailing: 16))
            }
			.onDelete(perform: deleteItem)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Tem certeza que deseja excluir toda a lista?"),
                      primaryButton: .default(Text("Ok")) {
                    cleanList()
                }, secondaryButton: .cancel())
            }
            .frame(height: 48)
            .background(Color(hex: "#7584F2"))
            .cornerRadius(5)
        }
        .buttonStyle(.plain)
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
        .listStyle(.plain)
    }
    
    var voidView: some View {
        VStack {
            Spacer()
            VoidView()
            Spacer()
        }
    }
    
	var body: some View {
        VStack {
            if listViewModel.isEmpty {
                voidView
            } else {
                listView
            }
            
            Button(action: {showAlert = true}) {
                Text("Limpar lista")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 48)
            .background(Color(hex: "#BE6161"))
            .cornerRadius(5)
            .padding()
            .opacity(listViewModel.isEmpty ? 0 : 1)
        }
	}

	func deleteItem(_ index: IndexSet) {
        $listViewModel.remove(atOffsets: index)
	}
    
    func deleteItemFromModal(id: String) {
        do {
            let realm = try Realm()
            if let itemToDelete = realm.objects(CellProductObject.self).filter("id == %@", id).first {
                try realm.write {
                    realm.delete(itemToDelete)
                    SheetKit().dismiss()
                }
            }
        } catch {
            print("Erro ao deletar lista de objetos: \(error)")
        }
    }

	func cleanList() {
		do {
			let realm = try Realm()
			try realm.write {
				realm.deleteAll()
			}
		} catch {
			print("Erro ao deletar lista de objetos: \(error)")
		}
	}

    func updateProduct(name: String, quantity: Int, isChecked: Bool, id: String) {
        
        do {
            let realm = try Realm()
            let itemToUpdate = realm.objects(CellProductObject.self).filter("id == %@", id).first
            try realm.write {
                itemToUpdate?.name = name
                itemToUpdate?.quantity = quantity
                itemToUpdate?.isChecked = isChecked
                SheetKit().dismiss()
            }
        } catch {
            print("Erro ao deletar lista de objetos: \(error)")
        }
    }
}

struct ListShoppingView_Previews: PreviewProvider {
	static var previews: some View {
        ListShoppingView()
	}
}




