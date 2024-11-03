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
    var cartViewModel: OrderViewModel?
    var item: ItemModel
    var color: Color
    var backgroundColor: Color
    var defaultButtonOpacity: Double
    var countButtonOpacity: Double
    @Binding var count: Int
    @Binding var addToCart: Bool
    @Binding var itemName: String
    @Binding var price: Double
    @State private var total: Double = 0
    
    
    public init(
        item: ItemModel = .init(image: ImageModel(), name: "", category: "", price: 0),
        cartViewModel: OrderViewModel?,
        color: Color = .clear,
        backgroundColor: Color = .clear,
        defaultButtonOpacity: Double = 0,
        countButtonOpacity: Double = 0,
        count: Binding<Int> = .constant(0),
        addToCart: Binding<Bool> = .constant(false),
        itemName: Binding<String> = .constant(""),
        price: Binding<Double> = .constant(0)
    ) {
        self.item = item
        self.cartViewModel = cartViewModel
        self.color = color
        self.backgroundColor = backgroundColor
        self.defaultButtonOpacity = defaultButtonOpacity
        self.countButtonOpacity = countButtonOpacity
        self._count = count
        self._addToCart = addToCart
        self._itemName = itemName
        self._price = price
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
            Capsule(style: .continuous)
                .strokeBorder(Color.black.opacity(0.5))
                .frame(width: 155, height: 40)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .overlay {
                    HStack(spacing: 5) {
                        Image("icon-add-to-cart")
                        Text("Add to Cart")
                            .foregroundStyle(Color.black)
                            .font(.custom("RedHatText-SemiBold", size: 12))
                    }
                }
        }
        .accessibilityIdentifier("addToCartButton")
        .opacity(defaultButtonOpacity)
    }
    
    func cartCountButton() -> some View {
        Button {
            addToCart.toggle()
        } label: {
            Capsule(style: .continuous)
                .strokeBorder(color)
                .frame(width: 155, height: 40)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .overlay {
                    HStack {
                        countButton(imageName: "icon-decrement-quantity") {
                            if count > 0 {
                                count -= 1
                                cartViewModel?.removeItem(itemName: itemName, count: count, price: price, total: total)
                            }
                            if count == 0 {
                                itemName = ""
                                price = 0
                            }
                        }
                        Spacer()
                        Text("\(count)")
                            .font(.custom("RedHatText-SemiBold", size: 15))
                            .foregroundStyle(Color.white)
                            .accessibilityIdentifier("countLabel")
                        Spacer()
                        countButton(imageName: "icon-increment-quantity") {
                            count += 1
                            itemName = item.name
                            price = item.price
                        }
                    }
                    .padding(.horizontal, 12)
                    .opacity(countButtonOpacity)
                }
        }
        .accessibilityIdentifier("cartCountButton")
    }
    
    func countButton(imageName: String, action: (() -> Void)? ) ->  some View {
        Button {
            action?()
            total = price * Double(count)
            cartViewModel?.addItem(itemName: itemName, count: count, price: price, total: total)
            
        } label: {
            Circle()
                .strokeBorder(Color.white, lineWidth: 1)
                .frame(width: 15, height: 15)
                .overlay {
                    Image(imageName)
                }
        }
    }
}

