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
    @State var cartViewModel: OrderViewModel? = nil
    @Query var products: [ItemModel]
    let loader: ProductLoader = ProductLoader()
    @Binding var addToCart: Bool
    @Binding var itemName: String
    @Binding var price: Double
    @Binding var count: Int
    @Query var orders: [OrderModel]
    
    public init(
        count: Binding<Int> = .constant(0),
        price: Binding<Double> = .constant(0),
        itemName: Binding<String> = .constant(""),
        addToCart: Binding<Bool> = .constant(false)
    ) {
        self._count = count
        self._price = price
        self._itemName = itemName
        self._addToCart = addToCart
    }
    
    var body: some View {
        ZStack {
            Color.launchScreenBackground.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                MainHeaderView()
                
                ScrollView {
                    VStack {
                        ForEach(products, id: \.self) { item in
                            ProductItemView(item: item, cartViewModel: OrderViewModel(context: context))
                        }
                        Spacer(minLength: 60)
                        CartView()
                        Spacer(minLength: 100)
                    }
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

