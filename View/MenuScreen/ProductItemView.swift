//
//  ProductItemView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI
import SwiftData

struct ProductItemView: View {
  @EnvironmentObject var orderVM: OrderViewModel
  @EnvironmentObject var updater: ProductUpdater
  @State private var addToCart: Bool = false
  @State private var count: Int = 0
  let item: ItemModel
  let order: OrderModel
  init(
    item: ItemModel = .init(image: ImageModel(), name: "", category: "", price: 0),
    order: OrderModel = OrderModel()
  ) {
    self.item = item
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
        }
      productInfo
    }
    .padding(.horizontal, 20)
  }
}

extension ProductItemView {
  var imageView: some View {
    VStack {
      productImageView
        .renderingMode(.original)
        .resizable()
        .scaledToFit()
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(content: {
          RoundedRectangle(cornerRadius: 10)
            .strokeBorder(imageButtonBorderColor, lineWidth: 4)
        })
        .accessibilityIdentifier("ProductImage-\(item.image.mobile)")
    }
  }
  
  private var productImageView: Image {
    return Image(item.image.mobile)
  }
  
  var imageButtonBorderColor: Color {
    addToCart ? Color.buttonBackground : Color.clear
  }
  
  var productItemButton: some View {
    ButtonView(
      count: Binding(
        get: { updater.getCount(for: item.name) },
        set: { updater.setCount(for: item.name, to: $0) }
      ),
      addToCart: $addToCart,
      item: item
    )
    .environmentObject(updater)
    .offset(y: 20)
    .accessibilityIdentifier("ProductItemButton")
  }
  
  var productInfo: some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(item.category)
        .font(.custom("RedHatText-SemiBold", size: 10))
        .foregroundStyle(Color.catFontColor.opacity(0.7))
        .padding(.top, 20)
        .accessibilityIdentifier("ProductCategory-\(item.category)")
      Text(item.name)
        .font(.custom("RedHatText-SemiBold", size: 15))
        .accessibilityIdentifier("ProductName-\(item.name)")
      Text("$\(item.price, specifier: "%.2f")")
        .font(.custom("RedHatText-Bold", size: 12))
        .foregroundStyle(Color.buttonBackground)
        .accessibilityIdentifier("ProductPrice-\(item.price)")
    }
    .padding(.vertical, 10)
  }
}
