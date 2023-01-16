//
//  DiamondShape.swift
//  Set
//
//  Created by Alvaro Orellana on 27-11-22.
//

import SwiftUI

struct DiamondShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.minX, y: rect.midY)
        let bottom = CGPoint(x: rect.maxX, y: rect.midY)
        let left = CGPoint(x: rect.midX, y: rect.minY)
        let right = CGPoint(x: rect.midX, y: rect.maxY)
        
        var path = Path()
        path.move(to: top)
        path.addLine(to: left)
        path.addLine(to: bottom)
        path.addLine(to: right)
        path.addLine(to: top)
        
        return path
    }
    

}

struct DiamondShape_Previews: PreviewProvider {
    static var previews: some View {
        DiamondShape()
    }
}
