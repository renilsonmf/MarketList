//
//  View+Extensions.swift
//  MarketList
//
//  Created by Danrlei Ribeiro Azevedo on 19/06/23.
//

import SwiftUI

extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}
