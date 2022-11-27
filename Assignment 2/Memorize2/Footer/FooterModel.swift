//
//  FooterModel.swift
//  Memorize2
//
//  Created by Alvaro Orellana on 08-09-22.
//

import Foundation
import SwiftUI

struct FooterModel {
    let buttons: [ButtonModel]
}


struct ButtonModel: Identifiable {
    let id: Int
    let size: ButtonSize = .medium
    let hierarchy: ButtonHierarchy // = .loud(textColor: .white, backgroundColor: .blue)
    let label: String
    let action: ButtonAction = .custom
    // let conditionalBehaviour: [ButtonBehaviour: ButtonCondition]
    
    
    enum ButtonSize: Int {
        case small = 24
        case medium = 32
        case large = 48
    }

    enum ButtonHierarchy {
        case loud(textColor: Color = .white, backgroundColor: Color = .blue)
        case quiet(textColor: Color = .blue, backgroundColor: Color = .green)
        case transparent(textColor: Color = .blue, backgroundColor: Color = .white)
        
        var textColor: Color {
            switch self {
            case .loud(let textColor, _):
                return textColor

            case .quiet(let textColor, _):
                return textColor

            case .transparent(let textColor, _):
                return textColor
            }
        }
        
        var backgroundColor: Color {
            switch self {
            case .loud(_, let backgroundColor):
                return backgroundColor

            case .quiet(_, let backgroundColor):
                return backgroundColor

            case .transparent(_, let backgroundColor):
                return backgroundColor
            }
        }
    }
    
    enum ButtonAction {
        case post
        case exit
        case deeplink
        case url
        case openModal
        case custom
    }
}
