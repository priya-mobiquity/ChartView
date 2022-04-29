//
//  Helpers.swift
//
//
//  Created by András Samu on 2019. 07. 19..
//

import Foundation
import SwiftUI

public enum Colors {
    public static let color1: Color = .init(hexString: "#E2FAE7")
    public static let color1Accent: Color = .init(hexString: "#72BF82")
    public static let color2: Color = .init(hexString: "#EEF1FF")
    public static let color2Accent: Color = .init(hexString: "#4266E8")
    public static let color3: Color = .init(hexString: "#FCECEA")
    public static let color3Accent: Color = .init(hexString: "#E1614C")
    public static let OrangeEnd: Color = .init(hexString: "#FF782C")
    public static let OrangeStart: Color = .init(hexString: "#EC2301")
    public static let LegendText: Color = .init(hexString: "#A7A6A8")
    public static let LegendColor: Color = .init(hexString: "#E8E7EA")
    public static let LegendDarkColor: Color = .init(hexString: "#545454")
    public static let IndicatorKnob: Color = .init(hexString: "#F05A23")
    public static let GradientUpperBlue: Color = .init(hexString: "#C2E8FF")
    public static let GradinetUpperBlue1: Color = .init(hexString: "#A8E1FF")
    public static let GradientPurple: Color = .init(hexString: "#7B75FF")
    public static let GradientNeonBlue: Color = .init(hexString: "#6FEAFF")
    public static let GradientLowerBlue: Color = .init(hexString: "#F1F9FF")
    public static let DarkPurple: Color = .init(hexString: "#1B205E")
    public static let BorderBlue: Color = .init(hexString: "#4EBCFF")
    public static let charcoal = Color(hexString: "#121212")
}

public struct GradientColor {
    public let start: Color
    public let end: Color

    public init(_ color: Color) {
        start = color
        end = color
    }

    public init(start: Color, end: Color) {
        self.start = start
        self.end = end
    }

    public func getGradient() -> Gradient {
        Gradient(colors: [start, end])
    }
}

public enum GradientColors {
    public static let orangeStraight = GradientColor(start: Color(hexString: "#F05A24"), end: Color(hexString: "#F05A24"))
    public static let orange = GradientColor(start: Colors.OrangeStart, end: Colors.OrangeEnd)
    public static let blue = GradientColor(start: Colors.GradientPurple, end: Colors.GradientNeonBlue)
    public static let green = GradientColor(start: Color(hexString: "0BCDF7"), end: Color(hexString: "A2FEAE"))
    public static let blu = GradientColor(start: Color(hexString: "0591FF"), end: Color(hexString: "29D9FE"))
    public static let bluPurpl = GradientColor(start: Color(hexString: "4ABBFB"), end: Color(hexString: "8C00FF"))
    public static let purple = GradientColor(start: Color(hexString: "741DF4"), end: Color(hexString: "C501B0"))
    public static let prplPink = GradientColor(start: Color(hexString: "BC05AF"), end: Color(hexString: "FF1378"))
    public static let prplNeon = GradientColor(start: Color(hexString: "FE019A"), end: Color(hexString: "FE0BF4"))
    public static let orngPink = GradientColor(start: Color(hexString: "FF8E2D"), end: Color(hexString: "FF4E7A"))
}

public enum Styles {
    public static let lineChartStyleOneDark = ChartStyle(
        backgroundColor: Colors.charcoal,
        accentColor: Colors.OrangeStart,
        secondGradientColor: Colors.OrangeEnd,
        textColor: Color.white,
        legendTextColor: Color.gray,
        dropShadowColor: Color.gray
    )

    public static let lineChartStyleOneLight = ChartStyle(
        backgroundColor: Color.white,
        accentColor: Colors.OrangeStart,
        secondGradientColor: Colors.OrangeEnd,
        textColor: Color.black,
        legendTextColor: Color.gray,
        dropShadowColor: Color.gray,
        darkModeStyle: Styles.lineChartStyleOneDark
    )

    public static let barChartStyleOrangeLight = ChartStyle(
        backgroundColor: Color.white,
        accentColor: Colors.OrangeStart,
        secondGradientColor: Colors.OrangeEnd,
        textColor: Color.black,
        legendTextColor: Color.gray,
        dropShadowColor: Color.gray
    )

    public static let barChartStyleOrangeDark = ChartStyle(
        backgroundColor: Color.black,
        accentColor: Colors.OrangeStart,
        secondGradientColor: Colors.OrangeEnd,
        textColor: Color.white,
        legendTextColor: Color.gray,
        dropShadowColor: Color.gray
    )

    public static let barChartStyleNeonBlueLight = ChartStyle(
        backgroundColor: Color.white,
        accentColor: Colors.GradientNeonBlue,
        secondGradientColor: Colors.GradientPurple,
        textColor: Color.black,
        legendTextColor: Color.gray,
        dropShadowColor: Color.gray
    )

    public static let barChartStyleNeonBlueDark = ChartStyle(
        backgroundColor: Color.black,
        accentColor: Colors.GradientNeonBlue,
        secondGradientColor: Colors.GradientPurple,
        textColor: Color.white,
        legendTextColor: Color.gray,
        dropShadowColor: Color.gray
    )

    public static let barChartMidnightGreenDark = ChartStyle(
        backgroundColor: Color(hexString: "#36534D"), // 3B5147, 313D34
        accentColor: Color(hexString: "#FFD603"),
        secondGradientColor: Color(hexString: "#FFCA04"),
        textColor: Color.white,
        legendTextColor: Color(hexString: "#D2E5E1"),
        dropShadowColor: Color.gray
    )

    public static let barChartMidnightGreenLight = ChartStyle(
        backgroundColor: Color.white,
        accentColor: Color(hexString: "#84A094"), // 84A094 , 698378
        secondGradientColor: Color(hexString: "#50675D"),
        textColor: Color.black,
        legendTextColor: Color.gray,
        dropShadowColor: Color.gray
    )

    public static let pieChartStyleOne = ChartStyle(
        backgroundColor: Color.white,
        accentColor: Colors.OrangeEnd,
        secondGradientColor: Colors.OrangeStart,
        textColor: Color.black,
        legendTextColor: Color.gray,
        dropShadowColor: Color.gray
    )

    public static let lineViewDarkMode = ChartStyle(
        backgroundColor: Color.black,
        accentColor: Colors.OrangeStart,
        secondGradientColor: Colors.OrangeEnd,
        textColor: Color.white,
        legendTextColor: Color.white,
        dropShadowColor: Color.gray
    )
}

public enum ChartForm {
    #if os(watchOS)
        public static let small = CGSize(width: 120, height: 90)
        public static let medium = CGSize(width: 120, height: 160)
        public static let large = CGSize(width: 180, height: 90)
        public static let extraLarge = CGSize(width: 180, height: 90)
        public static let detail = CGSize(width: 180, height: 160)
    #else
        public static let small = CGSize(width: 180, height: 120)
        public static let medium = CGSize(width: 180, height: 240)
        public static let large = CGSize(width: 360, height: 120)
        public static let extraLarge = CGSize(width: 360, height: 240)
        public static let detail = CGSize(width: 180, height: 120)
    #endif
}

public class ChartStyle {
    public var backgroundColor: Color
    public var accentColor: Color
    public var gradientColor: GradientColor
    public var textColor: Color
    public var legendTextColor: Color
    public var dropShadowColor: Color
    public weak var darkModeStyle: ChartStyle?

    public init(backgroundColor: Color, accentColor: Color, secondGradientColor: Color, textColor: Color, legendTextColor: Color, dropShadowColor: Color, darkModeStyle: ChartStyle? = nil) {
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        gradientColor = GradientColor(start: accentColor, end: secondGradientColor)
        self.textColor = textColor
        self.legendTextColor = legendTextColor
        self.dropShadowColor = dropShadowColor
        self.darkModeStyle = darkModeStyle
    }

    public init(backgroundColor: Color, accentColor: Color, gradientColor: GradientColor, textColor: Color, legendTextColor: Color, dropShadowColor: Color, darkModeStyle: ChartStyle? = nil) {
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.gradientColor = gradientColor
        self.textColor = textColor
        self.legendTextColor = legendTextColor
        self.dropShadowColor = dropShadowColor
        self.darkModeStyle = darkModeStyle
    }

    public init(formSize _: CGSize) {
        backgroundColor = Color.white
        accentColor = Colors.OrangeStart
        gradientColor = GradientColors.orange
        legendTextColor = Color.gray
        textColor = Color.black
        dropShadowColor = Color.gray
    }
}

public class ChartData: ObservableObject, Identifiable {
    @Published public var points: [(String, Double)]
    var valuesGiven: Bool = false
    var ID = UUID()

    public init<N: BinaryFloatingPoint>(points: [N]) {
        self.points = points.map { ("", Double($0)) }
    }

    public init<N: BinaryInteger>(values: [(String, N)]) {
        points = values.map { ($0.0, Double($0.1)) }
        valuesGiven = true
    }

    public init<N: BinaryFloatingPoint>(values: [(String, N)]) {
        points = values.map { ($0.0, Double($0.1)) }
        valuesGiven = true
    }

    public init<N: BinaryInteger>(numberValues: [(N, N)]) {
        points = numberValues.map { (String($0.0), Double($0.1)) }
        valuesGiven = true
    }

    public init<N: BinaryFloatingPoint & LosslessStringConvertible>(numberValues: [(N, N)]) {
        points = numberValues.map { (String($0.0), Double($0.1)) }
        valuesGiven = true
    }

    public func onlyPoints() -> [Double] {
        points.map(\.1)
    }
}

public class MultiLineChartData: ChartData {
    var gradient: GradientColor

    public init<N: BinaryFloatingPoint>(points: [N], gradient: GradientColor) {
        self.gradient = gradient
        super.init(points: points)
    }

    public init<N: BinaryFloatingPoint>(points: [N], color: Color) {
        gradient = GradientColor(start: color, end: color)
        super.init(points: points)
    }

    public func getGradient() -> GradientColor {
        gradient
    }
}

public enum TestData {
    public static var data: ChartData = .init(points: [37, 72, 51, 22, 39, 47, 66, 85, 50])
    public static var values: ChartData = .init(values: [("2017 Q3", 220),
                                                         ("2017 Q4", 1550),
                                                         ("2018 Q1", 8180),
                                                         ("2018 Q2", 18440),
                                                         ("2018 Q3", 55840),
                                                         ("2018 Q4", 63150), ("2019 Q1", 50900), ("2019 Q2", 77550), ("2019 Q3", 79600), ("2019 Q4", 92550)])
}

extension Color {
    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255)
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (r, g, b) = (int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: 1.0)
    }
}

public class HapticFeedback {
    #if os(watchOS)
        // watchOS implementation
        public static func playSelection() {
            WKInterfaceDevice.current().play(.click)
        }

    #elseif os(iOS)
        // iOS implementation
        let selectionFeedbackGenerator = UISelectionFeedbackGenerator()

        public static func playSelection() {
            UISelectionFeedbackGenerator().selectionChanged()
        }
    #else
        public static func playSelection() {
            // No-op
        }
    #endif
}

