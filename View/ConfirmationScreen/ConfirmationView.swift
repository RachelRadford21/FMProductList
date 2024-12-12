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
    @EnvironmentObject var updater: ProductUpdater
    @Binding var groupedOrders: [String: OrderModel]
    @Query var orders: [OrderModel]
    var orderVM: OrderViewModel?

    init(
        groupedOrders: Binding<[String: OrderModel]> = .constant([:]),
        orderVM: OrderViewModel
    ) {
        self._groupedOrders = groupedOrders
        self.orderVM = orderVM
    }
    
    var body: some View {
        ZStack {
            sheetBackgroundColor
            VStack(alignment: .leading) {
                Image("icon-order-confirmed")
                    .resizable()
                    .frame(width: 55, height: 55, alignment: .leading)
                Text("Order \nConfirmed")
                    .font(.custom("RedHatText-Bold", size: 40))
                Text("We hope you enjoy your food!")
                    .foregroundStyle(Color.catFontColor)
                    .font(.custom("RedHatText-Regular", size: 15))
                   
            ForEach(Array(groupedOrders.values), id: \.id) { order in
                 CartItemView(itemName: order.itemName, quantity: order.quantity, price: order.price, total: order.total)
          }
            .onAppear {
                GroupedOrderView(
                  groupedOrders: $groupedOrders,
                  orders: orders,
                  orderVM: orderVM
                )
                .groupOrdersByProduct()
            }
        }
        .background(CardBackgroundView())
        
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
