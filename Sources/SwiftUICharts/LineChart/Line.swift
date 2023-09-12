//
//  Line.swift
//  LineChart
//
//  Created by András Samu on 2019. 08. 30..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct Line: View {
    @ObservedObject public var data: ChartData
    @Environment(\.colorScheme) var colorScheme
    @Binding public var frame: CGRect
    @Binding public var currentValue: String
    @Binding public var touchLocation: CGPoint
    @Binding public var showIndicator: Bool
    @Binding public var minDataValue: Double?
    @Binding public var maxDataValue: Double?
    @Binding public var lineWidth: Double
    @State private var showFull: Bool = false
    @Binding public var showBackground: Bool
    public var gradient: GradientColor = .init(start: Colors.GradientPurple, end: Colors.GradientNeonBlue)
    public var index: Int = 0
    let padding: CGFloat = 30
    public var curvedLines: Bool = true
    @Binding public var showText: Bool
    
    public init(
        data: ChartData,
        currentValue: Binding<String>,
        frame: Binding<CGRect>,
        touchLocation: Binding<CGPoint>,
        showIndicator: Binding<Bool>,
        minDataValue: Binding<Double?>,
        maxDataValue: Binding<Double?>,
        showBackground: Binding<Bool>,
        lineWidth: Binding<Double>,
        gradient: GradientColor = GradientColor(start: Colors.GradientPurple, end: Colors.GradientNeonBlue),
        index: Int = 0,
        curvedLines: Bool = true,
        showText: Binding<Bool> = .constant(true)
    ) {
        self.data = data
        _currentValue = currentValue
        _frame = frame
        _touchLocation = touchLocation
        _showIndicator = showIndicator
        _minDataValue = minDataValue
        _maxDataValue = maxDataValue
        _showBackground = showBackground
        _lineWidth = lineWidth
        self.gradient = gradient
        self.index = index
        self.curvedLines = curvedLines
        _showText = showText
    }
    
    var stepWidth: CGFloat {
        if data.points.count < 2 {
            return 0
        }
        return frame.size.width / CGFloat(data.points.count-1)
    }
    var stepHeight: CGFloat {
        var min: Double?
        var max: Double?
        let points = self.data.onlyPoints()
        if minDataValue != nil && maxDataValue != nil {
            min = minDataValue!
            max = maxDataValue!
        }else if let minPoint = points.min(), let maxPoint = points.max(), minPoint != maxPoint {
            min = minPoint
            max = maxPoint
        }else {
            return 0
        }
        if let min = min, let max = max, min != max {
            if (min <= 0){
                return (frame.size.height-padding) / CGFloat(max - min)
            } else {
                return (frame.size.height-padding) / CGFloat(max - min)
            }
        }
        return 0
    }
    var path: Path {
        let points = self.data.onlyPoints()
        return curvedLines ? Path.quadCurvedPathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight), globalOffset: minDataValue) : Path.linePathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight))
    }
    var closedPath: Path {
        let points = self.data.onlyPoints()
        return curvedLines ? Path.quadClosedCurvedPathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight), globalOffset: minDataValue) : Path.closedLinePathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight))
    }
    
    public var body: some View {
        ZStack {
            if(self.showFull && self.showBackground){
                self.closedPath
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [gradient.start, colorScheme == .dark ? Colors.charcoal : Color.white]),
                        startPoint: .bottom,
                        endPoint: .top
                    ))
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .transition(.opacity)
                   // .animation(.easeIn(duration: 1.6))
            }
            self.path
                .trim(from: 0, to: self.showFull ? 1:0)
                .stroke(LinearGradient(gradient: gradient.getGradient(), startPoint: .leading, endPoint: .trailing) ,style: StrokeStyle(lineWidth: lineWidth, lineJoin: .round))
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                //.animation(Animation.easeOut(duration: 1.2).delay(Double(self.index)*0.4))
                .onAppear {
                    self.showFull = true
            }
            .onDisappear {
                self.showFull = false
            }
            if self.showIndicator {
                if self.showText {
                    Text("\(self.currentValue)")
                        .position(CGPoint(x: self.getClosestPointOnPath(touchLocation: self.touchLocation).x, y: 0))
                        .font(.system(size: 12, weight: .medium, design: .default))
                        .foregroundColor(colorScheme == .dark ? Colors.white : Color.charcoal)
                }
                
                IndicatorPoint()
                    .position(self.getClosestPointOnPath(touchLocation: self.touchLocation))
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
        }
    }
    
    func getClosestPointOnPath(touchLocation: CGPoint) -> CGPoint {
        let closest = self.path.point(to: touchLocation.x)
        return closest
    }
    
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            Line(
                data: ChartData(points: [12, -230, 10, 54]),
                currentValue: .constant("$3.17"),
                frame: .constant(geometry.frame(in: .local)),
                touchLocation: .constant(CGPoint(x: 100, y: 12)),
                showIndicator: .constant(true),
                minDataValue: .constant(nil),
                maxDataValue: .constant(nil),
                showBackground: .constant(false),
                lineWidth: .constant(3)
            )
        }.frame(width: 320, height: 160)
    }
}
