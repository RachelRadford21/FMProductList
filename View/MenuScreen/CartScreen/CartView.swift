//
//  CartView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/31/24.
//

import SwiftUI
import SwiftData

struct CartView: View {
  @Environment(\.modelContext) var context
  @EnvironmentObject var updater: productUpdater
  @Query var orders: [OrderModel]
  var order: OrderModel?
  var orderVM: OrderViewModel?
  
  public init(
    order: OrderModel? = nil
  ) {
    self.order = order
  }
  
  var body: some View {
    VStack {
      if orders.isEmpty {
        emptyCartView
      } else {
        cartHeader
        cartItems
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(Color.white)
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
    )
  }
}

extension CartView {
  var cartHeader: some View {
    Text("Your Cart (\(updater.cartCount))")
      .font(.custom("RedHatText-Bold", size: 25))
      .foregroundStyle(Color.buttonBackground)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.bottom, 50)
      .padding(.leading, 20)
  }
  
  var emptyCartView: some View {
    VStack(alignment: .center) {
      cartHeader
      Image("illustration-empty-cart")
      Text("Your added Items will appear here.")
        .font(.custom("RedHatText-Bold", size: 12))
        .foregroundStyle(Color.catFontColor)
    }
  }
  
  var cartItems: some View {
    ForEach(orders, id: \.id) { item in
      VStack {
        Text("\(item.itemName)")
        HStack(spacing: 10) {
          Text("\(item.quantity)x")
          Text("@\(item.price, format: .currency(code: "USD"))")
          Text("\(item.total, format: .currency(code: "USD"))")
            .font(.headline)
            .foregroundStyle(Color.black)
        }
      }
    }
  }
}
