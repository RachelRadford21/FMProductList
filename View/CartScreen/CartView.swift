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
  var orderVM: OrderViewModel?
  
  public init(
    orderVM: OrderViewModel?
  ) {
    self.orderVM = orderVM
  }
  
  var body: some View {
    fullCartView
  }
}

extension CartView {
  
  var fullCartView: some View {
    VStack(alignment: .leading, spacing: 15) {
      CartHeaderView()
      if updater.cartTotalCount == 0 {
        emptyCartImageView
      } else {
        cartOrderView
          .onAppear {
            groupOrdersByProduct()
          }
          .onChange(of: orders) {
            groupOrdersByProduct()
          }
      }
    }
    .frame(width: 350)
    .frame(maxWidth: .infinity, minHeight: 300, maxHeight: .infinity, alignment: .leading)
    .background(
      RoundedRectangle(cornerRadius: 20)
        .foregroundStyle(Color.white)
        .opacity(0.6)
    )
  }
  
  var emptyCartImageView: some View {
    VStack(alignment: .center) {
      Image("illustration-empty-cart")
      Text("Your added Items will appear here.")
        .font(.custom("RedHatText-Bold", size: 12))
        .foregroundStyle(Color.catFontColor)
    }
    .frame(maxWidth: .infinity, alignment: .center)
  }
  
  var cartOrderView: some View {
    VStack {
      cartOrders
      cartTotalTextView
      CarbonNeutralView()
    }
    .padding(.leading, 20)
  }
  
  var cartOrders: some View {
    ForEach(Array(groupedOrders.values), id: \.id) { order in
      CartItemView(itemName: order.itemName, quantity: order.quantity, price: order.price, total: order.total)
        .frame(maxWidth: .infinity, alignment: .leading)
      
    }
  }
  
  var cartTotalTextView: some View {
    HStack {
      Text("Order Total ")
        .font(.custom("RedHatText-Bold", size: 15))
        .foregroundStyle(Color.catFontColor)
      Spacer()
      Text("$\(updater.orderTotal, specifier: "%.2f")")
        .font(.custom("RedHatText-Bold", size: 25))
        .foregroundStyle(Color.catFontColor)
        .brightness(-0.2)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
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


