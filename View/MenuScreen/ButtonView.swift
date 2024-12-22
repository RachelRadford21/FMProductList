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
  @State var orderImage: String = ""
  @Query var orders: [OrderModel]
  @Binding var count: Int
  @Binding var addToCart: Bool
  @Binding var itemName: String
  @Binding var price: Double
  @Binding var total: Double
  var item: ItemModel
  var order: OrderModel
  
  public init(
    count: Binding<Int> = .constant(0),
    addToCart: Binding<Bool> = .constant(false),
    itemName: Binding<String> = .constant(""),
    price: Binding<Double> = .constant(0),
    total: Binding<Double> = .constant(0),
    item: ItemModel = .init(image: ImageModel(), name: "", category: "", price: 0),
    order: OrderModel = OrderModel()
  ) {
    self._count = count
    self._addToCart = addToCart
    self._itemName = itemName
    self._price = price
    self._total = total
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
    .accessibilityIdentifier("cartCountButton").onChange(of: updater.isRowDeleted) {
     
      if updater.isRowDeleted  {
        
        addToCart = false
        
        total = 0
        updater.setCount(for: updater.itemName, to: 0)
  
        if !addToCart {
          updater.setCount(for: updater.itemName, to: 0)
        }
      }
    
      updater.itemName = ""
      itemName = ""
      updater.isRowDeleted = false
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
      
      total -= item.price
      itemName = item.name
      updater.itemName = itemName
      
    } else if count == 0 {
      updater.cartTotalCount -= count
      orderVM.removeItem(itemName: updater.itemName, count: count, price: price, total: total, image: orderImage)
      addToCart = false
      updater.itemName = ""
      
    }
    updater.orderTotal -= price
    orderVM.removeItem(itemName: updater.itemName, count: count, price: price, total: total)
    orderVM.groupOrdersByProduct(orders: orders)
  }
  
  func neutralCount() {
    
    orderImage = item.image.thumbnail.lowercased()
    orderVM.addItem(itemName: updater.itemName, count: count, price: price, total: total, image: orderImage)
    
    //   print("Order image: \(orderImage)")
  }
  
  func addValues() {
    count += 1
    itemName = item.name
    updater.itemName = itemName
    price = item.price
    total += price
    
    // This doesnt work as expected here but works in neutral() ??
    //    orderVM?.addItem(itemName: itemName, count: count, price: price, total: total)
    updater.cartTotalCount += 1
    updater.orderTotal += price
    orderVM.groupOrdersByProduct(orders: orders)
  }
}

