//
//  FooterView.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 08-09-22.
//

import SwiftUI

struct FooterView: View {
    
    let footerModel: FooterModel
    
    var body: some View {
        VStack {
            ForEach(footerModel.buttons) { button in
                ButtonView(model: button)
            }
        }
    }
}


struct ButtonView: View {
    
    let model: ButtonModel
    
    var body: some View {
        Button {
            print("button pressed")
        } label: {
            Text(model.label)
                .font(.body)
                .frame(maxWidth: .infinity)
                .padding(15)
                .foregroundColor(model.hierarchy.textColor)
                .background(model.hierarchy.backgroundColor)
                .cornerRadius(10)
        }
    }
    
}

struct FooterView_Previews: PreviewProvider {
    
    static var footerModel: FooterModel {
        FooterModel(buttons:
                        [
                            ButtonModel(id: 0, hierarchy: .loud(), label: "Continuar"),
                            ButtonModel(id: 1, hierarchy: .transparent(), label: "Ahora no"),
                            ButtonModel(id: 2, hierarchy: .quiet(), label: "Ahora no")

                        ]
        )
    }
    
    static var previews: some View {
        FooterView(footerModel: FooterView_Previews.footerModel)
    }
}



