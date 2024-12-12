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
    VStack {
      if updater.cartTotalCount == 0 {
        emptyCartImageView
      } else {
        cartOrderView
          .onAppear {
            GroupedOrderView(
              groupedOrders: $groupedOrders,
              orders: orders,
              orderVM: orderVM
            )
            .groupOrdersByProduct()
          }
          .onChange(of: orders) {
            GroupedOrderView(
              groupedOrders: $groupedOrders,
              orders: orders,
              
              orderVM: orderVM
            )
            .groupOrdersByProduct()
          }
      }
    }
  }
  
  var emptyCartImageView: some View {
    VStack(alignment: .center, spacing: 50) {
      CartHeaderView()
        .padding(.leading, 35)
      Image("illustration-empty-cart")
      Text("Your added Items will appear here.")
        .font(.custom("RedHatText-Bold", size: 12))
        .foregroundStyle(Color.catFontColor)
    }
    .background(CardBackgroundView(color: .white.opacity(0.6)))
  }
  
  var cartOrderView: some View {
    VStack(spacing: 20) {
      CartHeaderView()
        .padding(.bottom, 10)
      GroupedOrderView(
        groupedOrders: $groupedOrders,
        orders: orders,
        orderVM: orderVM
      )
      cartTotalTextView
      CarbonNeutralView()
      CartButtonView(orderVM: OrderViewModel(context: context))
    }
    .padding(40)
    .background(CardBackgroundView(minWidth: 350))
    .padding(.top, -55)
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
}


