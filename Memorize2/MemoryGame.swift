//
//  MemoryGame.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 07-09-22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Comparable {
    
    private(set) var cards: [Card]
    private var indexOfTheOneAndOnlyFaceupCard: Int?
    
    init(numberOfPairsOfCards: Int, content: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let pair1 = Card(id: pairIndex * 2, content: content(pairIndex))
            let pair2 = Card(id: pairIndex * 2 + 1, content: content(pairIndex))
            cards += [pair1, pair2]
        }
    }
 
    mutating func choose(_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
           
            if let faceupIndex = indexOfTheOneAndOnlyFaceupCard,
               faceupIndex != choosenIndex,
               !card.isMatched
            {
                // Check if cards match
                if cards[faceupIndex].content == cards[choosenIndex].content {
                    cards[faceupIndex].isMatched = true
                    cards[choosenIndex].isMatched = true
                }
                
                self.indexOfTheOneAndOnlyFaceupCard = nil
                
            } else {
                // Either all cards are face down or two cards are face up
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                self.indexOfTheOneAndOnlyFaceupCard = choosenIndex
            }
            cards[choosenIndex].isFaceUp.toggle()
        }
    }
    
    
    struct Card: Identifiable {
        let id: Int
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}
