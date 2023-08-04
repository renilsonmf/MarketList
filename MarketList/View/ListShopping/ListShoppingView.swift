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
                Text("subtitle".localized)
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
            Text("uncheck_all".localized)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 48)
        .background(Color(hex: "#7584F2"))
        .cornerRadius(5)
        .opacity(listViewModel.isEmpty ? 0 : 1)
        .alert(isPresented: $showAlertUnchecked) {
            Alert(title: Text("confirm_uncheck".localized),
                  primaryButton: .default(Text("Ok")) {
                uncheckAll()
            }, secondaryButton: .cancel())
        }
    }
    
	var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("market_list".localized)
                    .font(Font.custom("Roboto-Bold", size: 36))
                    .foregroundColor(Color.black)

                Spacer()

                Button(action: showModalAddShoppingView) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))

            if listViewModel.isEmpty {
                voidView
            } else {
                listView
            }
            HStack(spacing: 8) {
                Button(action: {showAlertCleanList = true}) {
                    Text("clean_list".localized)
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 48)
                .background(Color(hex: "#BE6161"))
                .cornerRadius(5)
                .opacity(listViewModel.isEmpty ? 0 : 1)
                .alert(isPresented: $showAlertCleanList) {
                    Alert(title: Text("confirm_clean".localized),
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
    
    private func showModalAddShoppingView() {
        SheetKit().present(with: .bottomSheet) {
            AddShoppingView()
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
            fatalError()
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
            fatalError()
        }
    }

	func cleanList() {
		do {
			let realm = try Realm()
			try realm.write {
				realm.deleteAll()
			}
		} catch {
             fatalError()
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
            fatalError()
        }
    }
}



