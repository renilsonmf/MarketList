import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    func formatPrice() -> String {
        let pureNumber = self
            .replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)

        guard let intValue = Int(pureNumber) else { return "" }

        let floatValue = Float(intValue) / 100.0

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current

        return formatter.string(from: NSNumber(value: floatValue)) ?? ""
    }

    func disformatString() -> String {
        let pureNumber = self
            .replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)

        guard let intValue = Int(pureNumber) else { return "" }

        let floatValue = Float(intValue) / 100.0

        return String(floatValue)
    }
}
