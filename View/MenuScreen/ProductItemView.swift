//
//  ProductItemView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI

struct ProductItemView: View {
  let item: ItemModel
  var orderVM: OrderViewModel
  @EnvironmentObject var updater: ProductUpdater
  @State private var addToCart: Bool = false
  @State private var count: Int = 0
  @State private var itemName: String = ""
  @State private var price: Double = 0
  @Binding var totalItemCount: Int
  
  public init(
    item: ItemModel = .init(image: ImageModel(), name: "", category: "", price: 0),
    orderVM: OrderViewModel,
    totalItemCount: Binding<Int> = .constant(0)
  ) {
    self.item = item
    self.orderVM = orderVM
    self._totalItemCount = totalItemCount
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
          ButtonView(
            item: item,
            orderVM: orderVM,
            color: addToCart ? Color.clear : Color.black.opacity(0.5),
            backgroundColor: addToCart ? Color.buttonBackground : Color.white,
            defaultButtonOpacity: addToCart ? 0 : 1,
            countButtonOpacity: addToCart ? 1 : 0,
            count: $count,
            addToCart: $addToCart,
            itemName: $itemName,
            price: $price
          )
          .environmentObject(updater)
          .offset(y: 20)
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
            .strokeBorder(addToCart ? Color.buttonBackground : Color.clear, lineWidth: 4)
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
  
  var productInfo: some View {
    VStack(alignment: .leading) {
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
