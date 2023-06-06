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
 Animação botões - Lottie
 Usar combine para alguma coisa
 Tratamento para DarkMode
 Persistência de dados - refatoração e clean code
 Sugestões de produtos
 Zerar depois de adicionar produto
 Editar produto
 getList() ser @State para recarregar a view com mudanças
*/
