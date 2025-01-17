//
//  ConfirmationView.swift
//  FMProductList
//
//  Created by Rachel Radford on 12/7/24.
//

import SwiftUI
import SwiftData

struct ConfirmationView: View {
  @Environment(\.modelContext) var context
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var updater: ProductUpdater
  @EnvironmentObject var orderVM: OrderViewModel
  @Query var orders: [OrderModel]
  @Query var items: [ItemModel]
  
  var body: some View {
    confirmationView
  }
}

extension ConfirmationView {
  var confirmationView: some View {
    ZStack {
      sheetBackgroundColor
      ScrollView {
        VStack(alignment: .leading, spacing: 20) {
          scrollViewContent
        }
        .padding(60)
        .background(CardBackgroundView(minWidth: 350, minHeight: 500))
        .padding(.top, 100)
        .onAppear {
          orderVM.fetchOrders()
          orderVM.groupOrdersByProduct(orders: orders)
        }
        
      }
      .scrollIndicators(.hidden)
    }
  }
  
  @ViewBuilder
  var scrollViewContent: some View {
    orderConfirmedText
    orderContentView
  }
  
  var orderConfirmedText: some View {
    VStack(alignment: .leading) {
      Image("icon-order-confirmed")
        .resizable()
        .frame(width: 55, height: 55, alignment: .leading)
      Text("Order \nConfirmed")
        .font(.custom("RedHatText-Bold", size: 40))
      Text("We hope you enjoy your food!")
        .foregroundStyle(Color.catFontColor)
        .font(.custom("RedHatText-Regular", size: 20))
        .padding(.bottom, 10)
        .padding(.top, -5)
    }
  }
  
  @ViewBuilder
  var orderContentView: some View {
    GroupedOrderView(isConfirmationView: true)
    CartTotalView(updater: _updater)
    CartButtonView(action: {
      updater.isStartingNewOrder = true
      deletePreviousOrder()
      updater.isOrderConfirmed.toggle()
      updater.isStartingNewOrder = false
    }, buttonTitle: "Start New Order")
  }
 
  var sheetBackgroundColor: some View {
    Color.launchScreenBackground
      .brightness(-0.04)
      .ignoresSafeArea()
  }
  
  func deletePreviousOrder() {
    let descriptor = FetchDescriptor<OrderModel>()
    do {
      
      let fetchedOrders = try context.fetch(descriptor)
      
      for order in fetchedOrders {
        context.delete(order)
      }
      
      for item in items {
        updater.removeCount(for: item.name, to: 0)
      }
      
      try context.save()
    } catch {
      print("Error deleting orders: \(error)")
    }
    updater.orderTotal = 0
    updater.cartTotalCount = 0
    orderVM.groupedOrders.removeAll()
  }
}
