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
Adicionar campo checked no realm para controlar quando o usuario marcar que o item foi comprado.
Teclado descer quando clica fora
Ajustar bottom sheet


v2 -
Sugestões de produtos - Mais usados
*/
