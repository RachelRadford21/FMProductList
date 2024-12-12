//
//  CardBackgroundView.swift
//  FMProductList
//
//  Created by Rachel Radford on 12/7/24.
//

import SwiftUI

struct CardBackgroundView: View {
  var color: Color = .white
  var minWidth: CGFloat = 300
  var minHeight: CGFloat = 400
  
  var body: some View {
    
    VStack {
      RoundedRectangle(cornerRadius: 20)
        .foregroundStyle(color)
        .padding(20)
        .opacity(0.6)
    }
    .frame(minWidth: minWidth, maxWidth: .infinity, minHeight: minHeight, maxHeight: .infinity, alignment: .center)
  }
}

#Preview {
  CardBackgroundView()
}
