//
//  Pie.swift
//  Memorize
//
//  Created by 仝华帅 on 2021/4/1.
//

import SwiftUI

struct Pie: Shape {
    var startAngel: Angle
    var endAngel: Angle
    var clockWise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint (
            x: center.x + radius * cos(CGFloat(startAngel.radians)),
            y: center.y + radius * sin(CGFloat(startAngel.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngel,
            endAngle: endAngel,
            clockwise: clockWise)
        p.addLine(to: center)
        return p
    }
}
