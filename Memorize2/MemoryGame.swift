//
//  MemoryGame.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 07-09-22.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int, createContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let pair1 = Card(content: createContent(pairIndex)) // pair index deberia ser el mismo en los 2?
            let pair2 = Card(content: createContent(pairIndex))
            cards += [pair1, pair2]
        }
    }
 
    func choose(_ card: Card) {
        
    }
    
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
