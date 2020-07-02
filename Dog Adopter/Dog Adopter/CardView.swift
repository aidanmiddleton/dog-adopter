//
//  CardView.swift
//  Dog Adopter
//
//  Created by Aidan Middleton on 2020-07-01.
//  Copyright © 2020 Aidan Middleton. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @State private var translation: CGSize = .zero
    
    var body: some View {
        // 1
        GeometryReader { geometry in
                        
            // 2
            VStack(alignment: .leading) {
                Image("dog 3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.75) // 3
                    .clipped()
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Sammy")
                            .font(.title)
                            .bold()
                        Text("3 Years Old")
                            .font(.subheadline)
                            .bold()
                        Text("Female")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer() // Add a spacer to push our HStack to the left and the spacer fill the empty space
                    
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                }.padding(.horizontal)
            }
            // Add padding, corner radius and shadow with blur radius
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0) // 2
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                // 3
                DragGesture()
                    // 4
                    .onChanged { value in
                        self.translation = value.translation
                    }.onEnded { value in
                        self.translation = .zero
                    }
            )
        }
    }
}

// 4
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().frame(height: 400).padding()
    }
}
