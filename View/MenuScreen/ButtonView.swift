//
//  ButtonView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI

struct ButtonView: View {
    var color: Color
    var backgroundColor: Color
    var defaultButtonOpacity: Double
    var countButtonOpacity: Double
    @Binding var count: Int
    @Binding var addToCart: Bool
    
    public init(
        color: Color = .clear,
        backgroundColor: Color = .clear,
        defaultButtonOpacity: Double = 0,
        countButtonOpacity: Double = 0,
        count: Binding<Int> = .constant(0),
        addToCart: Binding<Bool> = .constant(false)
    ) {
        self.color = color
        self.backgroundColor = backgroundColor
        self.defaultButtonOpacity = defaultButtonOpacity
        self.countButtonOpacity = countButtonOpacity
        self._count = count
        self._addToCart = addToCart
    }
    var body: some View {
        buttonView
    }
}

extension ButtonView {
    
    @ViewBuilder
    var buttonView: some View {
        addToCartButton()
        
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
                .frame(width: 130, height: 40)
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
        .opacity(defaultButtonOpacity)
    }
    
    func cartCountButton() -> some View {
        Button {
            addToCart.toggle()
        } label: {
            Capsule(style: .continuous)
                .strokeBorder(color)
                .frame(width: 130, height: 40)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .overlay {
                    HStack {
                        countButton(imageName: "icon-decrement-quantity") {
                            if count > 0 { count -= 1 }
                        }
                        Spacer()
                        Text("\(count)")
                            .font(.custom("RedHatText-SemiBold", size: 12))
                            .foregroundStyle(Color.white)
                        Spacer()
                        countButton(imageName: "icon-increment-quantity") { count += 1 }
                    }
                    .padding(.horizontal, 12)
                    .opacity(countButtonOpacity)
                }
        }
    }
    
    func countButton(imageName: String, action: (() -> Void)? ) ->  some View {
        Button {
            action?()
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
#Preview {
    ButtonView()
}
