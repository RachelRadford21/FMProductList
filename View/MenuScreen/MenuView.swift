//
//  MenuView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI

struct MenuView: View {
 
  let loader: ProductLoader = ProductLoader()
  
  var body: some View {
    menuView
      .accessibilityIdentifier("MenuView")
  }
}

extension MenuView {
  var menuView: some View {
    ZStack {
      Color.launchScreenBackground.ignoresSafeArea()
      
      VStack(alignment: .leading) {
        MainHeaderView()
        MenuScrollView()
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
}

