//
//  CartButtonView.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/23/24.
//

import SwiftUI

struct CartButtonView: View {
  @EnvironmentObject var updater: ProductUpdater
  
    var buttonTitle: String
    var action: () -> Void?
    
    init(
        action: @escaping () -> Void?,
        buttonTitle: String = "Confirm Order"
    ) {
        self.action = action
        self.buttonTitle = buttonTitle
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            orderConfirmationLabel
        }
    }
}

extension CartButtonView {
  var orderConfirmationLabel: some View {
    Capsule(style: .continuous)
      .strokeBorder(Color.clear)
      .frame(height: 50)
      .background(Color.buttonBackground)
      .clipShape(RoundedRectangle(cornerRadius: 25))
      .overlay {
          Text(buttonTitle)
          .foregroundStyle(Color.white)
      }
  }
}

//#Preview {
//    CartButtonView()
//}
