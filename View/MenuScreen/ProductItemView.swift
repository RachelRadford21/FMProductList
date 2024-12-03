//
//  ProductItemView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI
import SwiftData

struct ProductItemView: View {
    let item: ItemModel
    var orderVM: OrderViewModel
    @EnvironmentObject var updater: ProductUpdater
    @State private var addToCart: Bool = false
    @State private var count: Int = 0
    @State private var itemName: String = ""
    @State private var price: Double = 0
    @Binding var totalItemCount: Int
    @Query var items: [ItemModel]
    @Query var orders: [OrderModel]
    var order: OrderModel
    let loader: ProductLoader = ProductLoader()
    public init(
        item: ItemModel = .init(image: ImageModel(), name: "", category: "", price: 0),
        orderVM: OrderViewModel,
        totalItemCount: Binding<Int> = .constant(0),
        order: OrderModel = OrderModel()
    ) {
        self.item = item
        self.orderVM = orderVM
        self._totalItemCount = totalItemCount
        self.order = order
    }
    
    var body: some View {
        productView
    }
}

extension ProductItemView {
    @ViewBuilder
    var productView: some View {
        VStack(alignment: .leading, spacing: 0) {
            imageView
                .overlay(alignment: .bottom) {
                    productItemButton
                        .onChange(of: updater.isRowDeleted) {
                            for order in orders {
                                if order.itemName == itemName {
                                    updater.setCount(for: item.name, to: 0)
                                }
                            }
                            
                        }
                }
            productInfo
        }
    }
}

extension ProductItemView {
    var imageView: some View {
        VStack {
            productImageView
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(imageButtonBorderColor, lineWidth: 4)
                })
        }
    }
    
    private var productImageView: Image {
        if item.category == "Crème Brûlée" {
            return Image("image-creme-brulee-mobile")
        } else {
            return Image("image-\(item.category.lowercased())-mobile")
        }
    }
    
    var imageButtonBorderColor: Color {
        addToCart ? Color.buttonBackground : Color.clear
    }
    
    var productItemButton: some View {
        ButtonView(
            item: item,
            orderVM: orderVM,
            count: Binding(
                get: { updater.getCount(for: item.name) },
                set: { updater.setCount(for: item.name, to: $0) }
            ),
            addToCart: $addToCart,
            itemName: $itemName,
            price: $price
        )
        .environmentObject(updater)
        .offset(y: 20)
    }
    
    var productInfo: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(item.category)
                .font(.custom("RedHatText-SemiBold", size: 10))
                .foregroundStyle(Color.catFontColor.opacity(0.7))
                .padding(.top, 20)
            Text(item.name)
                .font(.custom("RedHatText-SemiBold", size: 15))
            Text("$\(item.price, specifier: "%.2f")")
                .font(.custom("RedHatText-Bold", size: 12))
                .foregroundStyle(Color.buttonBackground)
        }
        .padding(.vertical, 10)
    }
}
