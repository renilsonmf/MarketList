//
//  ToastView.swift
//  MarketList
//
//  Created by Danrlei Ribeiro Azevedo on 21/06/23.
//

import SwiftUI

struct ToastView: View {
    @Binding var isToastShowing: Bool
    @State var text: String
    @State var color: Color

    var body: some View {
        if isToastShowing {
            VStack {
                Spacer()
                    .frame(height: 36)
                Text(text)
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(color)
                    .cornerRadius(10)
                Spacer()
            }
            .transition(.move(edge: .top))
            .animation(.easeInOut)
            .ignoresSafeArea()
        }
    }
}
