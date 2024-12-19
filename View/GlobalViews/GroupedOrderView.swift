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
    @EnvironmentObject var orderVM: OrderViewModel
  @Query var orders: [OrderModel]
  var item: ItemModel
  var isConfirmationView: Bool
  init(
    item: ItemModel = ItemModel(image: ImageModel()),
    isConfirmationView: Bool = false
  ) {
    self.item = item
    self.isConfirmationView = isConfirmationView
  }
  var body: some View {
    cartOrders
        
  }
}

extension GroupedOrderView {
  var cartOrders: some View {
    ForEach(Array(orderVM.groupedOrders.values), id: \.id) { order in
      CartItemView(itemName: order.itemName, quantity: order.quantity, price: order.price, total: order.total, imageName: order.image, isConfirmationView: isConfirmationView)
    }
  }
}

//#Preview {
//    GroupedOrderView()
//}
