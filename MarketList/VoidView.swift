//
//  VoidView.swift
//  MarketList
//
//  Created by Renilson Moreira on 22/05/23.
//

import SwiftUI

struct VoidView: View {
    var body: some View {
        VStack {
            Image("cart-supermarket")
                .resizable()
                .frame(width: 73, height: 73, alignment: .center)
            Text("Sua lista está vazia!")
                .font(Font.custom("Roboto-Regular", size: 24))
        }
        .padding()
        .background(.gray)
    }
}

struct VoidView_Previews: PreviewProvider {
    static var previews: some View {
        VoidView()
            .previewLayout(.sizeThatFits)
    }
}
