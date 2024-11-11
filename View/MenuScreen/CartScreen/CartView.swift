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
    VStack(alignment: .leading, spacing: 5) {
      if updater.cartTotalCount == 0 {
        emptyCartView
      } else {
        VStack(alignment: .leading, spacing: 15) {
          cartHeader
          cartOrders
          cartTotalTextView
        }
        .padding(.vertical, 5)
        .padding(.leading, 50)
      }
    }
    .background(
      backgroundRectangleView
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
  
  var emptyCartView: some View {
    VStack(alignment: .center) {
      cartHeader
      Image("illustration-empty-cart")
      Text("Your added Items will appear here.")
        .font(.custom("RedHatText-Bold", size: 12))
        .foregroundStyle(Color.catFontColor)
    }
  }
  
  var cartHeader: some View {
    Text("Your Cart (\(updater.cartTotalCount))")
      .font(.custom("RedHatText-Bold", size: 25))
      .foregroundStyle(Color.buttonBackground)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var cartOrders: some View {
    ForEach(Array(groupedOrders.values), id: \.id) { order in
      VStack(alignment: .leading) {
        CartItemView(itemName: order.itemName, quantity: order.quantity, price: order.price, total: order.total)
      }
        dividerView
    }
  }
  
  var dividerView: some View {
    Divider()
      .foregroundStyle(Color.catFontColor)
      .brightness(-0.2)
      .padding(.horizontal)
  }
  
  var cartTotalTextView: some View {
    HStack(spacing: 60) {
      Text("Order Total ")
        .font(.custom("RedHatText-Bold", size: 16))
        .foregroundStyle(Color.catFontColor)
      
      Text("\(updater.cartTotalCount)")
        .font(.custom("RedHatText-Bold", size: 20))
        .foregroundStyle(Color.catFontColor)
        .brightness(-0.2)
   }
  }
  
  var backgroundRectangleView: some View {
    RoundedRectangle(cornerRadius: 10)
      .foregroundStyle(Color.white)
      .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
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


