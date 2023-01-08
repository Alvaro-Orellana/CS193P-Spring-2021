//
//  CardView.swift
//  Set
//
//  Created by Alvaro Orellana on 04-12-22.
//

import SwiftUI

struct CardView: View {
    let numberOfObjects: Int
    let color: Color
    let shape: SetGame.Card.Shape
    let shading: SetGame.Card.Shading
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 4)
                    .foregroundColor(.red)
                
                VStack {
                    
                    ForEach(0..<numberOfObjects) { _ in
                        switch shape {
                        case .diamond:
                            DiamondShape()
                            
                            
                            
                        case .squiggle:
                            SquiggleShape()
                            
                        case .oval:
                            Capsule()
                                .frame(maxHeight: geometry.size.height * 0.2)
                        }
                    }
                    .foregroundColor(color)
                    
                }
                .padding()
            }
            
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(numberOfObjects: 3, color: .purple, shape: .squiggle, shading: .open)
    }
}
