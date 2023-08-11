import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    func formatPrice() -> String {
        guard let valueFloat = Float(self) else { return String() }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current

        return formatter.string(from: NSNumber(value: valueFloat)) ?? ""
    }
}
