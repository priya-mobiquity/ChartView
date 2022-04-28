//
//  IndicatorPoint.swift
//  LineChart
//
//  Created by András Samu on 2019. 09. 03..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

struct IndicatorPoint: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(Colors.IndicatorKnob)
            Circle()
                .stroke(colorScheme == .dark ? Color.charcoal : Color.white, style: StrokeStyle(lineWidth: 3))
                .frame(width: 13, height: 13)

            Circle()
                .stroke(Colors.IndicatorKnob, style: StrokeStyle(lineWidth: 0.5))
                .frame(width: 16, height: 16)
        }
        .frame(width: 14, height: 14)
        .shadow(color: colorScheme == .dark ? Colors.LegendDarkColor : Colors.LegendColor, radius: 6, x: 0, y: 6)
    }
}

struct IndicatorPoint_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorPoint()
    }
}
