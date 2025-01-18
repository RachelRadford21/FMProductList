//
//  MainHeaderView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI

struct MainHeaderView: View {
    var body: some View {
        Text("Desserts")
            .font(.custom("RedHatText-Bold", size: 25))
            .padding(.leading, 20)
            .accessibilityIdentifier("MainHeader")
            
    }
}

#Preview {
    MainHeaderView()
}
