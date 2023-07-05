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
    @State var showAlertCleanList = false
    @State var showAlertUnchecked = false
    @State var allUncheckedTriggering = false

    var listView: some View {
        VStack(alignment: .leading, spacing: 16) {
            List {
                Text("Marque a caixinha dos produtos ao colocá-los no carrinho de compras ou clique no item para editar ou excluir.")
                    .font(Font.custom("Roboto-Regular", size: 16))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                    .foregroundColor(Color(hex: "#9A9C9E"))
                ForEach(listViewModel) { item in
                    CellProductMarketView(
                        allUncheckedTriggering: $allUncheckedTriggering,
                        isChecked: item.isChecked,
                        name: item.name,
                        quantity: item.quantity,
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
                .cornerRadius(5)
            }
            .buttonStyle(.plain)
            .listStyle(.plain)
        }
    }
    
    var voidView: some View {
        VStack(alignment: .center) {
            Spacer()
            VoidView()
            Spacer()
        }
    }
    
    var uncheckedButton: some View {
        Button(action: {showAlertUnchecked = shouldShowUncheckedButton()}) {
            Text("Desmarcar todos")
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 48)
        .background(Color(hex: "#7584F2"))
        .cornerRadius(5)
        .opacity(listViewModel.isEmpty ? 0 : 1)
        .alert(isPresented: $showAlertUnchecked) {
            Alert(title: Text("Tem certeza que deseja desmarcar todos os itens?"),
                  primaryButton: .default(Text("Ok")) {
                uncheckAll()
            }, secondaryButton: .cancel())
        }
    }
    
	var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Lista de compras")
                    .font(Font.custom("Roboto-Bold", size: 36))
                    .foregroundColor(Color.black)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                Spacer()
            }
            if listViewModel.isEmpty {
                voidView
            } else {
                listView
            }
            HStack(spacing: 8) {
                Button(action: {showAlertCleanList = true}) {
                    Text("Limpar lista")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 48)
                .background(Color(hex: "#BE6161"))
                .cornerRadius(5)
                .opacity(listViewModel.isEmpty ? 0 : 1)
                .alert(isPresented: $showAlertCleanList) {
                    Alert(title: Text("Tem certeza que deseja excluir toda a lista?"),
                          primaryButton: .default(Text("Ok")) {
                        cleanList()
                    }, secondaryButton: .cancel())
                }
                
                
                if shouldShowUncheckedButton() {
                    uncheckedButton
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
	}
    
    private func shouldShowUncheckedButton() -> Bool {
        var result = false
        listViewModel.forEach { item in
            if item.isChecked == true {
                result = true
                return
            }
        }
        return result
    }
    
    // MARK: Revisar
    func uncheckAll() {
        do {
            let realm = try Realm()
            let allItems = realm.objects(CellProductObject.self)
            try realm.write {
                for item in allItems {
                    item.isChecked = false
                }
                allUncheckedTriggering.toggle()
            }
        } catch {
            print("Erro ao deletar lista de objetos: \(error)")
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




