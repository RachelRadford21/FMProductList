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
  @EnvironmentObject var orderVM: OrderViewModel
  @EnvironmentObject var updater: ProductUpdater
  @Query var orders: [OrderModel]
  var isConfirmationView: Bool
  
  init(
    isConfirmationView: Bool = false
  ) {
    
    self.isConfirmationView = isConfirmationView
  }
  
  var body: some View {
    cartOrders
  }
}

extension GroupedOrderView {
  var cartOrders: some View {
    ForEach(Array(orderVM.groupedOrders.values), id: \.itemName) { order in
      CartItemView(order: order, isConfirmationView: isConfirmationView)
    }
    .onChange(of: updater.isRowDeleted) {
      orderVM.fetchOrders()
      orderVM.groupOrdersByProduct(orders: orders)
      
    }
  }
}


//#Preview {
//    GroupedOrderView()
//}
