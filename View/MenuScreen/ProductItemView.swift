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
              color: addToCart ? Color.clear : Color.black.opacity(0.5),
              backgroundColor: addToCart ? Color.buttonBackground : Color.white,
              defaultButtonOpacity: addToCart ? 0 : 1,
              countButtonOpacity: addToCart ? 1 : 0,
              count: $count, addToCart: $addToCart
            )
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
