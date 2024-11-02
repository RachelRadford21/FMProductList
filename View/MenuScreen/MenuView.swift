//
//  MenuView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI
import SwiftData

struct MenuView: View {
    @Environment(\.modelContext) var context
    @Query var products: [ItemModel]
    let loader: ProductLoader = ProductLoader()
    @Binding var addToCart: Bool
    @Binding var itemName: String
    @Binding var price: Double
    @Binding var count: Int
    var order: OrderModel
    
    public init(
        count: Binding<Int> = .constant(0),
        price: Binding<Double> = .constant(0),
        itemName: Binding<String> = .constant(""),
        addToCart: Binding<Bool> = .constant(false),
        order: OrderModel = .init(id: UUID(), itemName: "", quantity: 0, price: 0, total: 0)
    ) {
        self._count = count
        self._price = price
        self._itemName = itemName
        self._addToCart = addToCart
        self.order = order
    }
    var body: some View {
        ZStack {
            Color.launchScreenBackground.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                MainHeaderView()
                ScrollView {
                    ForEach(products, id: \.self) { item in
                        ProductItemView(item: item)
                    }
                    
                    Button {
                        print("order: \(order.itemName)")
                        print("order: \(order.price)")
                        print("order: \(order.total)")
                    } label: {
                        Text("SAVE")
                    }
                    //  CartView()
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .scrollIndicators(.hidden)
                .refreshable {
                    Task {
                        try await loader.fetchProducts()
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
