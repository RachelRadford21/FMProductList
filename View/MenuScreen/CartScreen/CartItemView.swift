//
//  CartItemView.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/10/24.
//

import SwiftUI

struct CartItemView: View {
  var itemName: String
  var quantity: Int
  var price: Double
  var total: Double
  
  init(
    itemName: String = "",
    quantity: Int = 0,
    price: Double = 0,
    total: Double = 0
  ) {
    self.itemName = itemName
    self.quantity = quantity
    self.price = price
    self.total = total
  }
  
  var body: some View {
    if quantity > 0 {
      VStack(alignment: .leading, spacing: 5) {
        Text("\(itemName)")
          .font(.custom("RedHat-SemiBold", size: 16))
          .foregroundStyle(Color.black.opacity(0.9))
        
        HStack(spacing: 10) {
          Text("\(quantity)x")
            .font(.custom("RedHatText-SemiBold", size: 15))
            .foregroundStyle(Color.buttonBackground)
          Text("@ \(price, format: .currency(code: "USD"))")
            .font(.custom("RedHatText-Regular", size: 15))
            .foregroundStyle(Color.catFontColor)
          Text("\(total, format: .currency(code: "USD"))")
            .font(.custom("RedHatText-Regular", size: 15))
            .foregroundStyle(Color.catFontColor).brightness(-0.2)
        }
        .padding(.top, 5)
      }
      .padding(.vertical, 10)
    }
  }
}

#Preview {
    CartItemView()
}
