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
  var itemName: String
  var quantity: Int
  var price: Double
  var total: Double
  var order: OrderModel?
  @Binding var count: Int
  init(
    itemName: String = "",
    quantity: Int = 0,
    price: Double = 0,
    total: Double = 0,
    order: OrderModel? = OrderModel(),
    count: Binding<Int> = .constant(0)
  ) {
    self.itemName = itemName
    self.quantity = quantity
    self.price = price
    self.total = total
    self.order = order
    self._count = count
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
      count = 0
      updater.cartTotalCount -= order?.quantity ?? 0
      do {
        try context.delete(model: OrderModel.self, where: #Predicate { order in
          order.itemName == itemName
        })
      } catch {
        print("error: \(error)")
      }
    } label: {
      Circle()
        .strokeBorder(Color.catFontColor, lineWidth: 1)
        .frame(width: 15, height: 15)
        .overlay {
          Image("icon-remove-item")
        }
    }
  }
  var dividerView: some View {
    Divider()
      .foregroundStyle(Color.catFontColor)
      .brightness(-0.2)
      .padding(.horizontal)
  }
}

//#Preview {
//    CartItemView()
//}
