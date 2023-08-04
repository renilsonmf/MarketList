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
Componente Alert
Realm Manager
Tirar Clojure gigante (Int, String, ....) -> Void
Criar componente de botão

v2 -
Sugestões de produtos - Recorrência
Calculadora de preço
Limpar Realm quando atualizar aplicativo
 */
