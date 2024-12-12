//
//  CartButtonView.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/23/24.
//

import SwiftUI
import SwiftData

struct CartButtonView: View {
    @Environment(\.modelContext) var context
    @State var isOrderConfirmed: Bool = false
    var orderVM: OrderViewModel?
  
  init(
      orderVM: OrderViewModel
  ) {
      self.orderVM = orderVM
  }
  
    var body: some View {
      
      Button {
          isOrderConfirmed.toggle()
      } label: {
        orderConfirmationLabel
      }
      .frame(height: 50)
      .frame(maxWidth: .infinity, alignment: .center)
      .sheet(isPresented: $isOrderConfirmed) {
        ConfirmationView( orderVM: OrderViewModel(context: context))
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
