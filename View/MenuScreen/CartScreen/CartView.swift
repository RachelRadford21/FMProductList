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
    var order: OrderModel?
    @Binding var count: Int
    var orderVM: OrderViewModel?
    @State private var groupedOrders: [String: OrderModel] = [:]
    
    public init(
        count: Binding<Int> = .constant(0),
        order: OrderModel? = OrderModel()
    ) {
        self._count = count
        self.order = order
    }
    
    var body: some View {
        VStack {
            if orders.isEmpty {
                emptyCartView
            } else {
                cartHeader
                cartOrders
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.white)
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
        )
        .onAppear {
            groupOrdersByProduct()
        }
        .onChange(of: orders) {
            groupOrdersByProduct()
        }
    }
}

extension CartView {
    
    var cartHeader: some View {
        Text("Your Cart (\(updater.cartTotalCount))")
            .font(.custom("RedHatText-Bold", size: 25))
            .foregroundStyle(Color.buttonBackground)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 50)
            .padding(.leading, 20)
    }
    
    var emptyCartView: some View {
        VStack(alignment: .center) {
            cartHeader
            Image("illustration-empty-cart")
            Text("Your added Items will appear here.")
                .font(.custom("RedHatText-Bold", size: 12))
                .foregroundStyle(Color.catFontColor)
        }
    }
    
    var cartOrders: some View {
        VStack {
            ForEach(Array(groupedOrders.values), id: \.id) { order in
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(order.itemName)")
                        .font(.headline)
                        .foregroundStyle(Color.black)
                    
                    HStack(spacing: 10) {
                        Text("\(order.quantity)x")
                        Text("@\(order.price, format: .currency(code: "USD"))")
                        Text("\(order.total, format: .currency(code: "USD"))")
                            .font(.headline)
                            .foregroundStyle(Color.black)
                    }
                    .padding(.top, 5)
                }
                .padding(.vertical, 10)
            }
        }
    }
    
    private func groupOrdersByProduct() {
        groupedOrders = [:]
        for order in orders {
            if let existingOrder = groupedOrders[order.itemName] {
                existingOrder.quantity = order.quantity
                existingOrder.total = order.total
            }
            else {
                groupedOrders[order.itemName] = order
                print("order: \(order)")
            }
        }
    }
}


