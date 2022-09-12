//
//  ContentView.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 29-08-22.
//

import SwiftUI

//struct ContentView: View {
//
//    var numberOfCards: Int {
//        let elementsCount = ContentView.themes["Vehicules"]!.count
//        let random = Int.random(in: 4...elementsCount)
//        print("the random is \(random)")
//        return random
//    }
//
//    @State var theme = themes["Vehicules"]!
//
//    var body: some View {
//        NavigationView {
//            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
//                ForEach(theme[0..<numberOfCards], id: \.self) { emoji in
//                    CardView(image: emoji)
//                        .aspectRatio(2/3, contentMode: .fit)
//                }
//                .foregroundColor(.red)
//            }
//            .navigationTitle("Memorize!")
//        }
//    }
//
//}

struct CardView: View {
    
    var image: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
                
                Text(image)
                    .font(.largeTitle)
            } else {
                shape
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
