import Foundation

struct CellProductModel: Identifiable {
	let id = UUID()
	let name: String
	let quantity: Int
}

let listMock = [
	CellProductModel(name: "Açucar", quantity: 3),
	CellProductModel(name: "Pedro", quantity: 5),
	CellProductModel(name: "Maria", quantity: 10),
	CellProductModel(name: "Açucar", quantity: 3),
	CellProductModel(name: "Açucar", quantity: 3),
	CellProductModel(name: "Açucar", quantity: 3)
]

/*
 Retirar interação das bordas dos botões
 Apagar item unico. E a seleção de itens?
 Animação botões
 Usar combine para alguma coisa
 Tratamento para DarkMode
 User Defaults.
 */
