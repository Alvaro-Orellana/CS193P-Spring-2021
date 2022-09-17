//
//  ContentView.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 29-08-22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .navigationTitle("Memorize!")
        }
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if card.isFaceUp {
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
                
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape
            }
        }
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
