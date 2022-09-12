//
//  EmojiMemorygame.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 07-09-22.
//

import Foundation

class EmojiMemoryGame {
    
    static let themes = [
        "Vehicules": ["🚗", "🚕", "🚙", "🚌" ,"🚑" , "🏎", "🚜", "✈️", "🚀", "🚁", "⛵️"],
        "Animals": ["🐬", "🐢", "🐙", "🦄" ,"🐔" , "🐼", "🦊", "🐻", "🐮", "🐒", "🐷"],
        "Emoji Faces": ["😎", "☺️", "😍", "🤪" ,"🤓" , "😡", "😭", "😂", "🥹", "😦", "🤑"]
    ]
    
    let model = MemoryGame<String>(numberOfPairsOfCards: 5) { _ in
        return "😎"
    }
    
    
}
