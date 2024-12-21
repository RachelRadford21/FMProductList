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
    @Query var orders: [OrderModel]
    @EnvironmentObject var orderVM: OrderViewModel
   
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
                      updater.isOrderCancelled = true
                      
                     
                      updater.isOrderConfirmed.toggle()
                    }, buttonTitle: "Start New Order")
                    
                }
                .padding(60)
                .background(CardBackgroundView(minWidth: 350, minHeight: 500))
                .padding(.top, 100)
                .onAppear {
                  orderVM.fetchOrders()
                    orderVM.groupOrdersByProduct(orders: orders)
                }
                .onDisappear {
                  updater.isOrderCancelled = false
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
}

//#Preview {
//    ConfirmationView()
//}
