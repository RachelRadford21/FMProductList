//
//  MenuView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI
import SwiftData

struct MenuView: View {
  @Query private var products: [ItemModel]
  let loader: ProductLoader = ProductLoader()

  var body: some View {
    ZStack {
      Color.launchScreenBackground.ignoresSafeArea()
      VStack(alignment: .leading) {
        MainHeaderView()
        ScrollView {
          ForEach(products, id: \.self) { item in
            ProductItemView(item: item)
          }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .scrollIndicators(.hidden)
        .refreshable {
          Task {
            try await loader.fetchProducts()
          }
        }
      }
    }
    }
}

#Preview {
    MenuView()
}
