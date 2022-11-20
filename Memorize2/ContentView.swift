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
            VStack {
                HStack {
                    Spacer()
                    Text("Score: \(viewModel.score)")
                        .padding(.trailing)
                        .font(.headline)
                }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, gradient: viewModel.themeColor)
                            .aspectRatio(2/3, contentMode: .fit)
                           // .foregroundColor(viewModel.themeColor)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                Spacer()
                Button("New game", action: viewModel.newGame)
                    .padding(.all)
            }
            .navigationTitle(viewModel.themeName)
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    let gradient: [Color]
    
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
                    .fill(Gradient(colors: gradient))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
