//
//  SetGameViewModel.swift
//  Set
//
//  Created by Alvaro Orellana on 27-11-22.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    
    @Published private var model = SetGame()
    
    var cards: [Card] {
        model.visibleCards
    }
    
    func color(for card: Card) -> Color {
        switch card.object.color {
        case .red:
            return .red
        case .green:
            return .green
        case .purple:
            return .purple
        }
    }
    
    
    func selectCard(_ card: Card) {
        model.cardSelected(card: card)
    }
   
}
