//
//  MemoryGame.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 07-09-22.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card] = []
    private var indexOfTheOneAndOnlyFaceupCard: Int?
    private(set) var score = 0
    private let numberOfPointsPerMatch = 2
    private var previouslySeenCards: Set<Card.ID> = []
    private var timePassed: Date = .now
    
    init(numberOfPairsOfCards: Int, content: (Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardContent = content(pairIndex)
            let card1 = Card(id: pairIndex * 2, content: cardContent)
            let card2 = Card(id: pairIndex * 2 + 1, content: cardContent)
            
            cards.append(contentsOf: [card1, card2])
        }
        cards.shuffle()
    }
 
    mutating func choose(_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            
           
            if let faceupIndex = indexOfTheOneAndOnlyFaceupCard,
               faceupIndex != choosenIndex,
               !card.isMatched
            {
                if cards[faceupIndex].content == cards[choosenIndex].content {
                    // Cards matched
                    
                    cards[faceupIndex].isMatched = true
                    cards[choosenIndex].isMatched = true

                    let numberOfSecondsSinceLastCardWasChosen = timePassed.distance(to: .now)
                    let pointsEarned = max(10 - Int(numberOfSecondsSinceLastCardWasChosen), 1) * numberOfPointsPerMatch
                    score += pointsEarned
               
                } else {
                    // Cards mismatched, penalize score
                    let firstID = cards[faceupIndex].id
                    let secondID = cards[choosenIndex].id
                    
                    if previouslySeenCards.contains(firstID) {
                        score -= 1
                    }
                    if previouslySeenCards.contains(secondID) {
                        score -= 1
                    }
                }
                
                indexOfTheOneAndOnlyFaceupCard = nil
                
            } else {
                // Either all cards are face down or two cards are face up
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        previouslySeenCards.insert(cards[index].id)
                    }

                    cards[index].isFaceUp = false
                }
                
                timePassed = .now
                indexOfTheOneAndOnlyFaceupCard = choosenIndex
            }
            cards[choosenIndex].isFaceUp = true
        }
    }
    
    
    struct Card: Identifiable {
        let id: Int
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}

struct Theme {
    let name: String
    let emojis: [String]
    let pairsOfCards: Int
    let color: String
    
    // MARK: Extra credit
    init(name: String, emojis: [String], color: String) {
        self.name = name
        self.emojis = emojis
        self.pairsOfCards = emojis.count
        self.color = color
    }
    
    init(name: String, emojis: [String], pairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.pairsOfCards = pairsOfCards
        self.color = color
    }
    
    init(name: String, emojis: [String], color: String, showsRandomNumberOfPairsOfCards: Bool) {
        self.name = name
        self.emojis = emojis
        self.pairsOfCards = showsRandomNumberOfPairsOfCards ? Int.random(in: 1..<emojis.count) : emojis.count
        self.color = color
    }
}

