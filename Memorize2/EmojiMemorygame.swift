//
//  EmojiMemorygame.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 07-09-22.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let themes = [
        "Vehicules":   ["🚗", "🚕", "🚙", "🚌" ,"🚑" , "🏎", "🚜", "✈️", "🚀", "🚁", "⛵️"],
        "Animals":     ["🐬", "🐢", "🐙", "🦄" ,"🐔" , "🐼", "🦊", "🐻", "🐮", "🐒", "🐷"],
        "Emoji Faces": ["😎", "☺️", "😍", "🤪" ,"🤓" , "😡", "😭", "😂", "🥹", "😦", "🤑"]
    ]
    
    static let emojis = ["🚗", "🚕", "🚙", "🚌" ,"🚑" , "🏎", "🚜", "✈️", "🚀", "🚁", "⛵️"]
    
    static func createMemoryGame(numberOfPairsOfCards: Int) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }

    }
    
    @Published
    var model: MemoryGame<String> = createMemoryGame(numberOfPairsOfCards: 9)
    

    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
