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
        
   
        GeometryReader { geomtry in
            ScrollView {
                AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                        CardView(
                            numberOfObjects: viewModel.numberOfObjects(for: card),
                            color: viewModel.color(for: card),
                            shape: card.object.shape,
                            shading: card.object.shading
                        )
                }
            }
            .frame(minHeight: geomtry.size.height)
        }
        
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
