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
Componente Alert
Realm Manager
Tirar Clojure gigante (Int, String, ....) -> Void
Criar componente de botão
Empurrar keyboard mais para cima
Toast em device menor fica zuado

v2 -
Sugestões de produtos - Recorrência
Calculadora de preço
Desmarcar todos
Riscar campos marcado com o checked
Limpar Realm quando atualizar aplicativo
*/
