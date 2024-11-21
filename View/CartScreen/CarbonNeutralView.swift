//
//  CarbonNeutralView.swift
//  FMProductList
//
//  Created by Rachel Radford on 11/20/24.
//

import SwiftUI

struct CarbonNeutralView: View {
    var body: some View {
      carbonNeutralView
    }
}

extension CarbonNeutralView {
  
  var carbonNeutralView: some View {
    ZStack {
      Color.launchScreenBackground
        .opacity(0.2).frame(width: 300, height: 45)
        .clipShape(RoundedRectangle(cornerRadius: 10))
      HStack(spacing: 0) {
        carbonImageView
        carbonTextView

      }
    }
  }
  var carbonImageView: some View {
    Image("icon-carbon-neutral")
  }
  
  @ViewBuilder
  var carbonTextView: some View {
    Text("  This is a")
      .font(.custom("RedHatText-Regular", size: 14))
      .foregroundStyle(Color.catFontColor).brightness(-0.3)
    Text(" carbon-neutral ")
      .font(.custom("RedHatText-SemiBold", size: 14))
      .foregroundStyle(Color.catFontColor).brightness(-0.5)
    Text("delivery")
      .font(.custom("RedHatText-Regular", size: 14))
      .foregroundStyle(Color.catFontColor).brightness(-0.3)
  }
}
#Preview {
    CarbonNeutralView()
}
