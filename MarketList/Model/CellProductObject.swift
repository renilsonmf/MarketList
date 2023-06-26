import RealmSwift
import Foundation

final class CellProductObject: Object, Identifiable {
	@objc dynamic var id = UUID().uuidString
    @objc dynamic var isChecked = false
	@objc dynamic var name = ""
	@objc dynamic var quantity = 0

	override static func primaryKey() -> String? {
		return "id"
	}
}


/*
Ajustar imagem launch screen device menor
Ajustar mal funcionamento do stepper
Ajustar cor header

v2 -
Sugestões de produtos - Recorrência
Calculadora de preço
Desmarcar todos
Riscar campos marcado com o checked
*/
