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
  @EnvironmentObject var updater: ProductUpdater
  
  @Query var orders: [OrderModel]
  
  @State private var groupedOrders: [String: OrderModel] = [:]
  @State private var shouldShowItem: Bool = true
  
  
  var body: some View {
    VStack {
      if updater.cartTotalCount == 0 {
        emptyCartView
      } else {
        cartHeader
        cartOrders
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 10)
        .foregroundStyle(Color.white)
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
    )
    .onAppear {
      groupOrdersByProduct()
    }
    .onChange(of: orders) {
      groupOrdersByProduct()
    }
  }
}

extension CartView {
  
  var cartHeader: some View {
    Text("Your Cart (\(updater.cartTotalCount))")
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
  
  var cartOrders: some View {
    ForEach(Array(groupedOrders.values), id: \.id) { order in
      VStack(alignment: .leading, spacing: 5) {
        CartItemView(itemName: order.itemName, quantity: order.quantity, price: order.price, total: order.total)
      }
    }
  }
  
  private func groupOrdersByProduct() {
    groupedOrders = [:]
    
    for order in orders {
      if let existingOrder = groupedOrders[order.itemName] {
        existingOrder.quantity = order.quantity
        existingOrder.total = order.total
      } else {
        groupedOrders[order.itemName] = order
        
      }
    }
  }
}


