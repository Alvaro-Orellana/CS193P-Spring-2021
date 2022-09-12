//
//  PampaView.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 09-09-22.
//

import SwiftUI

struct PampaView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                ScrollView {
                    
                }
                FooterView(footerModel: FooterView_Previews.footerModel)
            }
            .padding([.horizontal])
            .navigationTitle("Titulo del flujo")
        }
    }
}

struct PampaView_Previews: PreviewProvider {
    static var previews: some View {
        PampaView()
    }
}
