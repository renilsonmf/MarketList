//
//  CellProductMarketView.swift
//  MarketList
//
//  Created by Danrlei Ribeiro Azevedo on 24/05/23.
//

import SwiftUI

struct CellProductMarketView: View {
    @State var isChecked = false
    @State var image: String = "Unchecked"

    var body: some View {
        HStack {
            VStack(
                alignment: .leading,
                spacing: 6
            ) {
                Text("Acucar")
                    .fontWeight(.bold)
                Text("Hello")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }

            Spacer()
            
            Button(action: action) {
                Image(image)
            }
        }
        .padding()
        .background(Color(hex: "#F5F5F5"))
        .cornerRadius(5)
    }
    
    func action() {
        isChecked.toggle()
        image = isChecked ? "Checked" : "Unchecked"
    }
}

struct CellProductMarketView_Previews: PreviewProvider {
    static var previews: some View {
        CellProductMarketView()
            .previewLayout(.sizeThatFits)
    }
}
