import RealmSwift
import Foundation

final class CellProductObject: Object, Identifiable {
	@objc dynamic var id = UUID().uuidString
	@objc dynamic var name = ""
	@objc dynamic var quantity = 0

	override static func primaryKey() -> String? {
		return "id"
	}
}


/*
 Retirar interação das bordas dos botões
 Animação botões - Lottie
 Usar combine para alguma coisa
 Sugestões de produtos
 Editar produto (Criar prototipo)
 Fixar fontes ( não esta funcionando )
*/
