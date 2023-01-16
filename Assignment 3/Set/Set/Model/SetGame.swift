//
//  SetGame.swift
//  Set
//
//  Created by Alvaro Orellana on 26-11-22.
//

import Foundation

struct SetGame {
    
    private let maxNumberOfVisibleCards = 12
    private(set) var score = 0
    
    private(set) var deck: [Card]
    private(set) var visibleCards: [Card]
    
    private var correctSets: [(Card, Card, Card)] = []
    
    private var selectedCards: [Card] = [] {
        didSet {
            if selectedCards.count == setMaxCapacity {
                playGame(card1: selectedCards[0], card2: selectedCards[1], card3: selectedCards[2])
                selectedCards = []
            }
        }
    }
    private let setMaxCapacity = 3
    
    init() {
        
        // Initialize deck with all possible combinations
        deck = []
        for number in Card.Number.allCases {
            for shape in Card.Shape.allCases {
                for shading in Card.Shading.allCases {
                    for color in Card.Color.allCases {
                        let card = Card(number: number, object: (shape, shading, color))
                        deck.append(card)
                    }
                }
            }
        }
        deck.shuffle()
        
        // Initialize visible cards
        visibleCards = []
        for _ in 0..<maxNumberOfVisibleCards {
            visibleCards.append(deck.removeFirst())
        }
    }
    
    mutating func cardSelected(card: Card) {
        // Check if card is already present. If so deselect it (Remove it)
        if let index = selectedCards.firstIndex(where: { $0.id == card.id }) {
            selectedCards.remove(at: index)
            return
        }

        selectedCards.append(card)

    }
    
    mutating func playGame(card1: Card, card2: Card, card3: Card) {
        let numbersAreEqual = isSet(feature1: card1.number, feature2: card2.number, feature3: card3.number)
        let shapesAreEqual = isSet(feature1: card1.object.shape, feature2: card2.object.shape, feature3: card3.object.shape)
        let shadingsAreEqual = isSet(feature1: card1.object.shading, feature2: card2.object.shading, feature3: card3.object.shading)
        let colorsAreEqual = isSet(feature1: card1.object.color, feature2: card2.object.color, feature3: card3.object.color)
        
        let resultIsAMatch = [numbersAreEqual, shapesAreEqual, shadingsAreEqual, colorsAreEqual].allSatisfy { $0 == true }
        
        if resultIsAMatch {
            score += 1
            correctSets.append((card1, card2, card3))
            removeCards(card1: card1, card2: card2, card3: card3)
            drawCards()
            
        } else {
            score -= 1
        }
        
    }
    
    
    private mutating func removeCards(card1: Card, card2: Card, card3: Card) {
        guard
            let card1Index = visibleCards.firstIndex(where: { $0.id == card1.id }),
            let card2Index = visibleCards.firstIndex(where: { $0.id == card2.id }),
            let card3Index = visibleCards.firstIndex(where: { $0.id == card3.id })
        else { return }
        
        visibleCards.remove(at: card1Index)
        visibleCards.remove(at: card2Index)
        visibleCards.remove(at: card3Index)
    }
    
    private mutating func drawCards() {
        while visibleCards.count < maxNumberOfVisibleCards && !deck.isEmpty {
            visibleCards.append(deck.removeFirst())
        }
    }
    
    
    // A set is 3 cards in which each individual feature is either
    // all the same on each card or all different on each card
    private func isSet<T: Equatable>(feature1: T, feature2: T, feature3: T) -> Bool {
        return (feature1 == feature2 && feature2 == feature3) || (feature1 != feature2 && feature1 != feature3 && feature2 != feature3)
    }
}


