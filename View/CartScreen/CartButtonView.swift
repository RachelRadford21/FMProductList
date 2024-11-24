//
//  CartButtonView.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/23/24.
//

import SwiftUI

struct CartButtonView: View {
    var body: some View {
      Button {
        
      } label: {
        Capsule(style: .continuous)
          .strokeBorder(Color.clear)
         
          .background(Color.buttonBackground)
          .clipShape(RoundedRectangle(cornerRadius: 25))
          .overlay {
            Text("Confirm Order")
              .foregroundStyle(Color.white)
          }
      }
      .frame(height: 50)
      .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    CartButtonView()
}
