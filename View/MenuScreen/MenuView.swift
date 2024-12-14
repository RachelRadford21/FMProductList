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
  @Query(sort: \ItemModel.name) var products: [ItemModel]
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
      .onAppear {
          Task {
              try await loader.fetchProducts()
          }
      }
    }
  }
  
  var menuScrollView: some View {
    ScrollView {
      VStack {
        ForEach(products, id: \.self) { item in
            ProductItemView(item: item)
        }
        Spacer(minLength: 60)
          CartView()
        Spacer(minLength: 100)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .scrollIndicators(.hidden)
  }
}

