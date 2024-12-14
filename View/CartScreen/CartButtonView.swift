//
//  CartButtonView.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/23/24.
//

import SwiftUI

struct CartButtonView: View {
    @State var isOrderConfirmed: Bool = false
    @State private var selectedDetent: PresentationDetent = .medium
    var body: some View {
      
      Button {
        isOrderConfirmed.toggle()
      } label: {
        orderConfirmationLabel
      }
      .frame(height: 50)
      .frame(maxWidth: .infinity, alignment: .center)
      .sheet(isPresented: $isOrderConfirmed) {
          ConfirmationView()
              .presentationDetents([.medium, .large], selection: $selectedDetent)
              .presentationDragIndicator(.visible)
      }
      
    }
}

extension CartButtonView {
  var orderConfirmationLabel: some View {
    Capsule(style: .continuous)
      .strokeBorder(Color.clear)
      .background(Color.buttonBackground)
      .clipShape(RoundedRectangle(cornerRadius: 25))
      .overlay {
        Text("Confirm Order")
          .foregroundStyle(Color.white)
      }
  }
}

//#Preview {
//    CartButtonView()
//}
