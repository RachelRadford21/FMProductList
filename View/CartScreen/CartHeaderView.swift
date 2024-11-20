//
//  CartHeaderView.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/18/24.
//

import SwiftUI

struct CartHeaderView: View {
  @EnvironmentObject var updater: ProductUpdater
  
  var body: some View {
    Text("Your Cart (\(updater.cartTotalCount))")
      .font(.custom("RedHatText-Bold", size: 25))
      .foregroundStyle(Color.buttonBackground)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding([.top, .leading], 20)
  }
}

#Preview {
  CartHeaderView()
}
