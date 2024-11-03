//
//  CartView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/31/24.
//

import SwiftUI
import SwiftData

struct CartView: View {
    @Query var orders: [OrderModel] 
    @Binding var count: Int
    
    public init(
        count: Binding<Int> = .constant(0)
    ) {
        self._count = count
    }
    var body: some View {
        VStack {
            
            if orders.isEmpty {
                VStack(alignment: .center) {
                    Text("Your Cart (\(orders.count))")
                        .font(.custom("RedHatText-Bold", size: 25))
                        .foregroundStyle(Color.buttonBackground)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 50)
                        .padding(.leading, 20)
                    Image("illustration-empty-cart")
                    Text("Your added Items will appear here.")
                        .font(.custom("RedHatText-Bold", size: 12))
                        .foregroundStyle(Color.catFontColor)
                }
            } else {
                Text("Cart")
                ForEach(orders, id: \.id) { item in
                    VStack {
                        Text("\(item.total, format: .currency(code: "USD") )")
                            .font(.headline)
                            .foregroundStyle(Color.black)
                        Text("\(item.itemName)")
                        
                        Text("@ \(item.price)")
                    }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.white)
                .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
        )
    }
}

#Preview {
    CartView()
}
