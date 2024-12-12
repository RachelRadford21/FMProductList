//
//  GroupedOrderView.swift
//  FMProductList
//
//  Created by Rachel Radford on 12/8/24.
//

import SwiftUI
import SwiftData

struct GroupedOrderView: View {
  @Environment(\.modelContext) var context
  @EnvironmentObject var updater: ProductUpdater
  
  @Binding var groupedOrders: [String: OrderModel]
  var orders: [OrderModel]
  var orderVM: OrderViewModel?
  
  public init(
    groupedOrders: Binding<[String: OrderModel]> = .constant([:]),
    orders: [OrderModel],
    orderVM: OrderViewModel?
  ) {
    self._groupedOrders = groupedOrders
    self.orders = orders
    self.orderVM = orderVM
  }
  
  var body: some View {
    cartOrders
  }
}

extension GroupedOrderView {
  var cartOrders: some View {
    ForEach(Array(groupedOrders.values), id: \.id) { order in
      CartItemView(itemName: order.itemName, quantity: order.quantity, price: order.price, total: order.total)
    }
  }
  
  func groupOrdersByProduct() {
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

//#Preview {
//    GroupedOrderView()
//}
