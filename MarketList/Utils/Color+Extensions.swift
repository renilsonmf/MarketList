import SwiftUI

extension Color {
    init(hex: String, opacity: Double = 1) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0

        scanner.scanLocation = 1
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, opacity: opacity)
    }
}
