//
//  AddToCartButtonView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI

struct AddToCartButtonView: View {
    var color: Color
    var backgroundColor: Color
    var defaultButtonOpacity: Double
    var countButtonOpacity: Double
    @Binding var count: Int
    
    public init(
        color: Color = .clear,
        backgroundColor: Color = .clear,
        defaultButtonOpacity: Double = 0,
        countButtonOpacity: Double = 0,
        count: Binding<Int> = .constant(0)
    ) {
        self.color = color
        self.backgroundColor = backgroundColor
        self.defaultButtonOpacity = defaultButtonOpacity
        self.countButtonOpacity = countButtonOpacity
        self._count = count
    }
    var body: some View {
        Capsule(style: .continuous)
            .strokeBorder(color)
            .frame(width: 130, height: 40)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .overlay {
                HStack {
                    Image("icon-add-to-cart")
                    Text("Add to Cart")
                        .font(.custom("RedHatText-SemiBold", size: 12))
                       
                }
                .opacity(defaultButtonOpacity)
                HStack {
                    Button {
                        count -= 1
                    } label: {
                        Circle()
                        
                            .strokeBorder(Color.white, lineWidth: 1)
                            .frame(width: 15, height: 15)
                            .overlay {
                                Image("icon-decrement-quantity")
                            }
                    }
                    Spacer()
                    Text("\(count)")
                        .font(.custom("RedHatText-SemiBold", size: 12))
                        .foregroundStyle(Color.white)
                    Spacer()
                    Button {
                        count += 1
                    } label: {
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 1)
                            .frame(width: 15, height: 15)
                            .overlay {
                                Image("icon-increment-quantity")
                            }
                    }
                }
                .padding(.horizontal, 12)
                .opacity(countButtonOpacity)
            }
    }
}

#Preview {
    AddToCartButtonView()
}
