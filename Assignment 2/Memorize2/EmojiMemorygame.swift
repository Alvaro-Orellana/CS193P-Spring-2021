//
//  EmojiMemorygame.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 07-09-22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let themes = [
        Theme(name: "Vehicules", emojis: ["ð", "ð", "ð", "ð" ,"ð" , "ð", "ð", "âïļ", "ð", "ð", "âĩïļ"], color: "red"),
        Theme(name: "Animals", emojis: ["ðŽ", "ðĒ", "ð", "ðĶ" ,"ð" , "ðž", "ðĶ", "ðŧ", "ðŪ", "ð", "ð·"], color: "yellow"),
        Theme(name: "Emoji Faces", emojis: ["ð", "âšïļ", "ð", "ðĪŠ" ,"ðĪ", "ðĄ", "ð­", "ð", "ðĨđ", "ðĶ", "ðĪ"], color: "blue", showsRandomNumberOfPairsOfCards: true),
        Theme(name: "Halloween", emojis: ["ð", "ðŧ", "ð", "ðŽ" ,"ðŦ", "ð­"], color: "orange", showsRandomNumberOfPairsOfCards: true)
    ]

    static let colors: [String: [Color]] = ["red": [.red, .orange], "yellow": [.yellow, .orange], "blue": [.blue, .purple], "orange": [.orange, .red, .purple]]
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let randomizedEmojis = theme.emojis.shuffled()
        var numberOfPairsToUse = theme.pairsOfCards
        
        // If a Theme mistakenly specifies to show more pairs of cards than there are emoji available,
        //then automatically reduce the count of cards to show to match the count of available emoji.
        if theme.pairsOfCards > theme.emojis.count  {
            numberOfPairsToUse = theme.emojis.count
        }
                
        return MemoryGame(numberOfPairsOfCards: numberOfPairsToUse) { pairIndex in
            randomizedEmojis[pairIndex]
        }
    }
    
    private(set) var currentTheme: Theme
    @Published private var model: MemoryGame<String>


    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var themeName: String {
        currentTheme.name
    }
    
    var score: String {
        String(model.score)
    }
    
    var themeColor: [Color] {
        EmojiMemoryGame.colors[currentTheme.color]!
    }
    
    init() {
        currentTheme = EmojiMemoryGame.themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(with: currentTheme)
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        // Update theme
        let randomThemeIndex = Int.random(in: 0..<EmojiMemoryGame.themes.count)
        currentTheme = EmojiMemoryGame.themes[randomThemeIndex]
        
        // Update model
        model = EmojiMemoryGame.createMemoryGame(with: currentTheme)
    }
}
