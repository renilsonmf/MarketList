import SwiftUI

struct VoidView: View {
    var body: some View {
        VStack {
            Image("cart-supermarket")
                .resizable()
                .frame(width: 140, height: 140, alignment: .center)
            Text("void_message".localized)
                .font(Font.custom("Roboto-Italic", size: 24))
                .foregroundColor(Color(hex: "#5F266D"))
        }
        .padding()
    }
}
