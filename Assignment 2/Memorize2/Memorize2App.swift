//
//  Memorize2App.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 29-08-22.
//

import SwiftUI

@main
struct Memorize2App: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
            // PampaView()
        }
    }
}
