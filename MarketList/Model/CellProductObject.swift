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
Ajustar mal funcionamento do stepper
adicionar Launch screen
Personalizar animação toast
Header na lista - aumentar a area de scroll
 Validação excluir elementos

v2 -
Sugestões de produtos - Recorrência
Calculadora de preço
Desmarcar todos
*/
