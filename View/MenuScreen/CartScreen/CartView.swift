//
//  CartView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/31/24.
//

import SwiftUI
import SwiftData

struct CartView: View {
    @Environment(\.modelContext) var context
    @Query var orders: [OrderModel]
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.white)
                .frame(width: 200, height: 200)
                .overlay {
                    ForEach(orders, id: \.id) { item in
                        Text("\(item.total)")
                            .font(.headline)
                            .foregroundStyle(Color.black)
                        Text("\(item.itemName)")
                        
                        Text("@ \(item.price)")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//#Preview {
//    CartView()
//}
