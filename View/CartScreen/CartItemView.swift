//
//  CartItemView.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/10/24.
//

import SwiftUI
import SwiftData

struct CartItemView: View {
  @Environment(\.modelContext) var context
  @EnvironmentObject var updater: ProductUpdater
  @EnvironmentObject var orderVM: OrderViewModel
  @Query var orders: [OrderModel]
  var order: OrderModel
  var item: ItemModel
  var isConfirmationView: Bool
  
  init(
    order: OrderModel = OrderModel(),
    item: ItemModel = ItemModel(image: ImageModel()),
    isConfirmationView: Bool = false
  ) {
    self.order = order
    self.item = item
    self.isConfirmationView = isConfirmationView
  }
  
  var body: some View {
    cartItemView
  }
}

extension CartItemView {
  
  var cartItemView: some View {
    VStack(alignment: .leading) {
      if order.quantity > 0 {
        Text("\(order.itemName)")
          .font(.custom("RedHatText-SemiBold", size: 18))
          .foregroundStyle(Color.black.opacity(0.9))
        
        HStack(spacing: 10) {
          cartTextView
          Spacer()
          if !isConfirmationView {
            cartRowDeleteButton
          }
        }
        .padding(.vertical, 5)
        dividerView
      }
    }
  }
  
  @ViewBuilder
  var cartTextView: some View {
      if isConfirmationView {
        Image(order.image)
          .resizable()
          .frame(width: 30, height: 30)
      }
      Text("\(order.quantity)x")
        .font(.custom("RedHatText-Bold", size: 17))
        .foregroundStyle(Color.buttonBackground)
      Text("@ \(order.price, format: .currency(code: "USD"))")
        .font(.custom("RedHatText-Regular", size: 17))
        .foregroundStyle(Color.catFontColor)
      Text("\(order.total, format: .currency(code: "USD"))")
        .font(.custom("RedHatText-SemiBold", size: 17))
        .foregroundStyle(Color.catFontColor).brightness(-0.2)
  }
  
  var cartRowDeleteButton: some View {
    Button {
      
      updater.isRowDeleted = true
      updater.itemName = order.itemName
      updater.orderTotal -= order.total
      updater.cartTotalCount -= order.quantity
      
      deleteRowOrder()
    
      orderVM.fetchOrders()
      orderVM.groupOrdersByProduct(orders: orders)
    } label: {
      deleteRowButton
    }
  }
  
  var deleteRowButton: some View {
    Circle()
      .strokeBorder(Color.catFontColor, lineWidth: 1)
      .frame(width: 15, height: 15)
      .overlay {
        Image("icon-remove-item")
      }
  }
  
  var dividerView: some View {
    Divider()
      .foregroundStyle(Color.catFontColor)
      .brightness(-0.2)
  }
  
  func deleteRowOrder() {
    do {
      try context.delete(model: OrderModel.self, where: #Predicate { order in
        // terrible practice but i cant use another itemName sooooooooooo
        order.itemName == order.itemName
      })
      try context.save()
    } catch {
      print("error: \(error)")
    }
  
    orderVM.groupedOrders.removeValue(forKey: order.itemName)
  }
}

//#Preview {
//    CartItemView()
//}
