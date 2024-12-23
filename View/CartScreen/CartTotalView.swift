//
//  CartTotalView.swift
//  FMProductList
//
//  Created by Rachel Radford on 12/13/24.
//

import SwiftUI

struct CartTotalView: View {
    @EnvironmentObject var updater: ProductUpdater
    
    var body: some View {
        HStack {
            Text("Order Total ")
                .font(.custom("RedHatText-Bold", size: 15))
                .foregroundStyle(Color.catFontColor)
            Spacer()
            Text("$\(updater.orderTotal, specifier: "%.2f")")
                .font(.custom("RedHatText-Bold", size: 25))
                .foregroundStyle(Color.catFontColor)
                .brightness(-0.2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    CartTotalView()
}
