//
//  SetGameViewModel.swift
//  Set
//
//  Created by Alvaro Orellana on 27-11-22.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    
    @Published private var model = SetGame()
    
    var cards: [SetGame.Card] {
        (0...15).map { i in
            model.deck[i]
        }
        //model.deck
    }
    
    func color(for card: SetGame.Card) -> Color {
        switch card.object.color {
        case .red:
            return .red
        case .green:
            return .green
        case .purple:
            return .purple
        }
    }
    
    func numberOfObjects(for card: SetGame.Card) -> Int {
        switch card.number {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        }
    }
}
