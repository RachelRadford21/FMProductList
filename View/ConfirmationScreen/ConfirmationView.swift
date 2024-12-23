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
    
    var body: some View {
        ZStack {
            sheetBackgroundColor
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
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

                  GroupedOrderView(isConfirmationView: true)
                    CartTotalView(updater: _updater)
                    CartButtonView(action: {
                      updater.isStartingNewOrder = true
                      deletePreviousOrder()
                      updater.isOrderConfirmed.toggle()
                              updater.isStartingNewOrder = false
                    }, buttonTitle: "Start New Order")
                    
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
}

extension ConfirmationView {
    
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
          // this still needs work when multiple orders being removed(count doesnt update for all items)
        updater.removeCount(for: order, to: 0)
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

//#Preview {
//    ConfirmationView()
//}
