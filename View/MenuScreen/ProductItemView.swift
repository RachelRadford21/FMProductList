//
//  ProductItemView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI

struct ProductItemView: View {
    let item: ItemModel
    @State private var addToCart: Bool = false
    @State private var count: Int = 0
    
    public init(
        item: ItemModel = .init(image: ImageModel(), name: "", category: "", price: 0)
    ) {
        self.item = item
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            productImageView
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(addToCart ? .buttonBackground : Color.clear, lineWidth: 4)
                )
                .overlay {
                    AddToCartButtonView(
                        color: addToCart ? Color.clear : Color.black.opacity(0.5),
                        backgroundColor: addToCart ? .buttonBackground : Color.white,
                        defaultButtonOpacity: addToCart ? 0 : 1,
                        countButtonOpacity: addToCart ? 1 : 0,
                        count: $count, addToCart: $addToCart
                    )
                    .offset(y: 115)
                }
            productInfo
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 10)
    }
}

extension ProductItemView {
    private var productImageView: Image {
        if item.category == "Crème Brûlée" {
            return Image("image-creme-brulee-mobile")
        } else {
            return Image("image-\(item.category  .lowercased())-mobile")
        }
    }
    var productInfo: some View {
        VStack(alignment: .leading) {
            Text(item.category)
                .font(.custom("RedHatText-Regular", size: 10))
                .padding(.top, 20)
            Text(item.name)
                .font(.custom("RedHatText-SemiBold", size: 15))
            Text("$\(item.price, specifier: "%.2f")")
                .font(.custom("RedHatText-Bold", size: 12))
                .foregroundStyle(Color.buttonBackground)
        }
    }
}
#Preview {
    ProductItemView()
}
