import RealmSwift
import Foundation

final class CellProductObject: Object, Identifiable {
	@objc dynamic var id = UUID().uuidString
    @objc dynamic var isChecked = false
	@objc dynamic var name = ""
    @objc dynamic var quantity = 0
	@objc dynamic var price = ""

	override static func primaryKey() -> String? {
		return "id"
	}
}

/*
Se sobrar tempo:
Criar uma arquitetura
Componente Alert
Realm Manager
Tirar Clojure gigante (Int, String, ....) -> Void
Criar componente de botão

v2 -
Soma final
Compartilhar lista
 */
