//
//  Card.swift
//  Set
//
//  Created by Alvaro Orellana on 15-01-23.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let number: Number
    let object: (shape: Card.Shape, shading: Shading, color: Card.Color)
    
    
    enum Number: Int, Equatable, CaseIterable {
        case one = 1
        case two = 2
        case three = 3
    }
    
    enum Shape: Equatable, CaseIterable {
        case diamond, squiggle, oval
    }
    
    enum Shading: Equatable, CaseIterable {
        case solid, striped, open
    }
    
    enum Color: Equatable, CaseIterable {
        case red, green, purple
    }
}

