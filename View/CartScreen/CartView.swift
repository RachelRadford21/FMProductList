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
  @EnvironmentObject var orderVM: OrderViewModel
  @Query var orders: [OrderModel]
  @State private var selectedDetent: PresentationDetent = .medium
  
  var body: some View {
    fullCartView
  }
}

extension CartView {
  
  var fullCartView: some View {
    VStack {
      if updater.cartTotalCount == 0 || updater.isStartingNewOrder {
        emptyCartImageView
      } else if !updater.isStartingNewOrder {
        cartOrderView
          .sheet(isPresented: $updater.isOrderConfirmed) {
            ConfirmationView()
              .presentationDetents([.medium, .large], selection: $selectedDetent)
              .presentationDragIndicator(.visible)
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
      GroupedOrderView()
      CartTotalView(updater: _updater)
      CarbonNeutralView()
      CartButtonView(action: {
        updater.isOrderConfirmed.toggle()
      })
    }
    .padding(40)
    .background(CardBackgroundView(minWidth: 350))
    .padding(.top, -55)
    .environmentObject(orderVM)
    .onAppear {
      orderVM.groupOrdersByProduct(orders: orders)
    }
    .onChange(of: orders) {
      orderVM.fetchOrders()
      orderVM.groupOrdersByProduct(orders: orders)
    }
  }
}


