//
//  ContentView.swift
//  Set
//
//  Created by Alvaro Orellana on 26-11-22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = SetGameViewModel()
    
    var body: some View {
        AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
            CardView(
                numberOfObjects: viewModel.numberOfObjects(for: card),
                color: viewModel.color(for: card),
                shape: card.object.shape
            )
            
            
        }
    }
}


struct CardView: View {
    
    let numberOfObjects: Int
    let color: Color
    let shape: SetGame.Card.Shape

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 4)
                .foregroundColor(.black)
    
            VStack(spacing: 10) {
                ForEach(0..<numberOfObjects) { _ in
                    switch shape {
                    case .diamond:
                         DiamondShape(verticalAngle: Angle(degrees: 100), horizontalAngle: Angle(degrees: 80))
                            .fill(color)
                        
                    case .squiggle:
                        Ellipse()
                            .fill(color)

                    
                    case .oval:
                        Capsule()
                            .fill(color)

                    }
                }
            }
            .padding()
            
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
