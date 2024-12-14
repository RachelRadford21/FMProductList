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
    cartItemView
  }
}

extension CartItemView {
  
  var cartItemView: some View {
    VStack(alignment: .leading) {
      if quantity > 0 {
        Text("\(itemName)")
          .font(.custom("RedHatText-SemiBold", size: 18))
          .foregroundStyle(Color.black.opacity(0.9))
        
        HStack(spacing: 10) {
          cartTextView
          
          Spacer()
          cartRowDeleteButton
        }
        .padding(.vertical, 5)
        dividerView
      }
    }
  }
  
  @ViewBuilder
  var cartTextView: some View {
    Text("\(quantity)x")
      .font(.custom("RedHatText-Bold", size: 17))
      .foregroundStyle(Color.buttonBackground)
    Text("@ \(price, format: .currency(code: "USD"))")
      .font(.custom("RedHatText-Regular", size: 17))
      .foregroundStyle(Color.catFontColor)
    Text("\(total, format: .currency(code: "USD"))")
      .font(.custom("RedHatText-SemiBold", size: 17))
      .foregroundStyle(Color.catFontColor).brightness(-0.2)
  }
  
  var cartRowDeleteButton: some View {
    Button {
      updater.isRowDeleted = true
      updater.itemName = itemName
      updater.orderTotal -= total
 //     do {
//        try context.delete(model: OrderModel.self, where: #Predicate { order in
//          order.itemName == itemName
//        })
          orderVM.removeItem(itemName: itemName, count: quantity, price: price, total: total)
//      } catch {
//        print("error: \(error)")
//      }
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
}

//#Preview {
//    CartItemView()
//}
