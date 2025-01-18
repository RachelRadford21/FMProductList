//
//  MenuScrollView.swift
//  FMProductList
//
//  Created by Rachel Radford on 12/24/24.
//

import SwiftUI
import SwiftData

struct MenuScrollView: View {
  @Environment(\.modelContext) var context
  @Query(sort: \ItemModel.name) var items: [ItemModel]
  
    var body: some View {
      ScrollView {
        VStack {
          ForEach(items, id: \.self) { item in
            ProductItemView(item: item)
              .accessibilityIdentifier("ProductItem-\(item.name)")
          }
          Spacer(minLength: 60)
          CartView()
            .accessibilityIdentifier("CartView")
          Spacer(minLength: 100)
                
        }

      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .scrollIndicators(.hidden)
    }
}
