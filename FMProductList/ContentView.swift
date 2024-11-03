//
//  ContentView.swift
//  FMProductList
//
//  Created by Rachel Radford on 10/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var isActive = false
    var body: some View {
        VStack {
            if !isActive {
                ZStack {
                    Color(#colorLiteral(red: 0.8784313725, green: 0.8431372549, blue: 0.8549019608, alpha: 1)).ignoresSafeArea()
                    Image("image-macaron-desktop")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 400)
                        .ignoresSafeArea()
                        .accessibilityIdentifier("macaronImage")
                }
            } else {
                withAnimation(.easeOut(duration: 2.0)) {
                    MenuView()
                        .accessibilityIdentifier("menuView")
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
