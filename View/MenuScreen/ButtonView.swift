//
//  ButtonView.swift
//  FMProductList
//
////  Created by Rachel Radford on 10/26/24.
////
//
import SwiftUI
import SwiftData

struct ButtonView: View {
  @Environment(\.modelContext) var context
  @EnvironmentObject var updater: ProductUpdater
  @EnvironmentObject var orderVM: OrderViewModel
  @Query var orders: [OrderModel]
  @Query var items: [ItemModel]
  @Binding var count: Int
  @Binding var addToCart: Bool
  var item: ItemModel
  var order: OrderModel
  
  init(
    count: Binding<Int> = .constant(0),
    addToCart: Binding<Bool> = .constant(false),
    item: ItemModel = .init(image: ImageModel(), name: "", category: "", price: 0),
    order: OrderModel = OrderModel()
  ) {
    self._count = count
    self._addToCart = addToCart
    self.item = item
    self.order = order
  }
  
  var body: some View {
    buttonView
  }
}

extension ButtonView {
  
  @ViewBuilder
  var buttonView: some View {
    addToCartButton()
      .accessibilityIdentifier("addToCartButton")
    
    if addToCart {
      cartCountButton()
    }
  }
  
  func addToCartButton() -> some View {
    Button {
      addToCart.toggle()
    } label: {
      buttonLabelView
        .overlay {
          addToCartButtonOverlay
        }
    }
    .accessibilityIdentifier("addToCartButton")
    .opacity(addToCartOpacity)
  }
  
  var addToCartButtonOverlay: some View {
    HStack(spacing: 5) {
      Image("icon-add-to-cart")
      Text("Add to Cart")
        .foregroundStyle(Color.black)
        .font(.custom("RedHatText-SemiBold", size: 12))
    }
  }
  
  func cartCountButton() -> some View {
    Button {
      addToCart.toggle()
    } label: {
      buttonLabelView
        .overlay {
          cartCountOverlay
        }
    }
    .accessibilityIdentifier("cartCountButton")
    .onChange(of: count) {
      for _ in items where count == 0 {
        addToCart = false
      }
    }
  }
  
  var cartCountOverlay: some View {
    HStack {
      subtractButton
      Spacer()
      countTextView
      Spacer()
      addButton
    }
    .padding(.horizontal, 12)
    .opacity(countOpacity)
  }
  
  var subtractButton: some View {
    countButton(imageName: "icon-decrement-quantity") {
      subtractValues()
    }
  }
  
  var countTextView: some View {
    Text("\(count)")
      .font(.custom("RedHatText-SemiBold", size: 15))
      .foregroundStyle(Color.white)
      .accessibilityIdentifier("countLabel")
  }
  
  var addButton: some View {
    countButton(imageName: "icon-increment-quantity") {
      addValues()
    }
  }
  
  func countButton(imageName: String, action: (() -> Void)?) ->  some View {
    Button {
      action?()
      neutralCount()
    } label: {
      Circle()
        .strokeBorder(Color.white, lineWidth: 1)
        .frame(width: 15, height: 15)
        .overlay {
          Image(imageName)
        }
    }
  }
  
  var buttonLabelView: some View {
    Capsule(style: .continuous)
      .strokeBorder(labelBorderColor)
      .frame(width: 155, height: 40)
      .background(buttonBackgroundColor)
      .clipShape(RoundedRectangle(cornerRadius: 25))
  }
  
  var addToCartOpacity: CGFloat {
    addToCart ? 0 : 1
  }
  
  var countOpacity: CGFloat {
    addToCart ? 1 : 0
  }
  
  var labelBorderColor: Color {
    addToCart ? Color.clear : Color.black.opacity(0.5)
  }
  
  var buttonBackgroundColor: Color {
    addToCart ? Color.buttonBackground : Color.white
  }
  
  func subtractValues() {
    if count > 0 {
      count -= 1
      updater.cartTotalCount -= 1
    } else if count == 0 {
      updater.cartTotalCount -= count
      addToCart = false
    }
    updater.orderTotal -= item.price
    orderVM.removeItem(
      itemName: item.name,
      count: count,
      price: item.price,
      total: order.total,
      image: order.image
    )
    orderVM.groupOrdersByProduct(orders: orders)
  }
  
  func neutralCount() {
    order.total = Double(count) * item.price
    orderVM.addItem(
      itemName: item.name,
      count: count,
      price: item.price,
      total: order.total,
      image: item.image.thumbnail
    )
  }
  
  func addValues() {
    count += 1
    updater.cartTotalCount += 1
    updater.orderTotal += item.price
    orderVM.groupOrdersByProduct(orders: orders)
  }
}

