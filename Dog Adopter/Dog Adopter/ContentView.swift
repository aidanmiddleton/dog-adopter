//
//  ContentView.swift
//  Dog Adopter
//
//  Created by Aidan Middleton on 2020-07-01.
//  Copyright © 2020 Aidan Middleton. All rights reserved.
//

import SwiftUI

struct Dog: Hashable, CustomStringConvertible {
    var id: Int
    
    let name: String
    let age: Int
    let description: String
    let imageName: String
    let location: String
    let sex: String
    let goodWithKids: BooleanLiteralType
    
    var info: String {
        return "\(name), id: \(id)"
    }
}

struct ContentView: View {
    
    @State var dogs: [Dog] = [
        Dog(id: 0, name: "Larry", age: 1, description: "A very good boy", imageName: "dog 1", location: "Richmond", sex: "Male", goodWithKids: true),
        Dog(id: 1, name: "Sophie", age: 4, description: "Sweetest smile you've ever seen", imageName: "dog 2", location: "Squamish", sex: "Female", goodWithKids: true),
        Dog(id: 2, name: "Gator", age: 8, description: "The loyalest of companions", imageName: "dog 3", location: "Salmon Arm", sex: "Male", goodWithKids: true),
        Dog(id: 3, name: "Gator", age: 8, description: "The loyalest of companions", imageName: "dog 3", location: "Salmon Arm", sex: "Male", goodWithKids: true),
        Dog(id: 4, name: "Gator", age: 8, description: "The loyalest of companions", imageName: "dog 3", location: "Salmon Arm", sex: "Male", goodWithKids: true),
        Dog(id: 5, name: "Gator", age: 8, description: "The loyalest of companions", imageName: "dog 3", location: "Salmon Arm", sex: "Male", goodWithKids: true),

    ]
    
    
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(dogs.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(dogs.count - 1 - id) * 10
    }
    
    private var maxID: Int {
        return self.dogs.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
       // 1
        VStack {
            
        
             GeometryReader { geometry in
                 // 5
                 VStack {
                     DateView()
                     
                      // 6
                     ZStack {
                         
                         // 7
                         ForEach(self.dogs, id: \.self) { dog in
                            
                           
                             CardView()
                                  // 8
                                 .frame(width: self.getCardWidth(geometry, id: dog.id), height: 400)
                                 .offset(x: 0, y: self.getCardOffset(geometry, id: dog.id))
                            
                         }
                     }
                     Spacer()
                 }
             }
            

        }.padding()
    }
}

// 2
struct DateView: View {
    var body: some View {
      // Container to add background and corner radius to
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Friday, 10th January")
                        .font(.title)
                        .bold()
                    Text("Today")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
