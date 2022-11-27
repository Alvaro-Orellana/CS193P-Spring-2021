//
//  HeaderView.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 09-09-22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe.americas.fill")
                .font(.headline)
            Text("Hasta tres lineas de texto para el titulo")
                .font(.title)
            Text("Bajada con hasta 20 lineas de texto. Lorem opsum dolor sit amet consectetur. Link")
                .font(.footnote)
        }
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
