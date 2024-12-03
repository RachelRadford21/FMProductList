//
//  MenuView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI
import SwiftData

struct MenuView: View {
  @Environment(\.modelContext) var context
  @Query var products: [ItemModel]
  let loader: ProductLoader = ProductLoader()
  
  var body: some View {
    menuView
  }
}

extension MenuView {
  var menuView: some View {
    ZStack {
      Color.launchScreenBackground.ignoresSafeArea()
      
      VStack(alignment: .leading) {
        MainHeaderView()
        menuScrollView
          .refreshable {
            Task {
              try await loader.fetchProducts()
            }
          }
      }
    }
  }
  
  var menuScrollView: some View {
    ScrollView {
      VStack {
        ForEach(products, id: \.self) { item in
          ProductItemView(item: item, orderVM: OrderViewModel(context: context))
        }
        Spacer(minLength: 60)
        CartView(orderVM: OrderViewModel(context: context))
        Spacer(minLength: 100)
      }
    }
    .padding(.horizontal, 20)
    .frame(maxWidth: .infinity, alignment: .leading)
    .scrollIndicators(.hidden)
  }
}

