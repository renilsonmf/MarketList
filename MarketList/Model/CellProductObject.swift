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
Ajustar bottom sheet
Ajustar mal funcionamento do stepper
Botão excluir do bottom sheet!

v2 -
Sugestões de produtos - Recorrência
*/
