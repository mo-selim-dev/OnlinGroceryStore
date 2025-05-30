//
//  UIExtension.swift
//  App1
//
//  Created by Mohamed Selim on 10/31/24.
//

import SwiftUI

enum Inter: String {
    case regular = "Gilroy-Regular"
    case medium = "Gilroy-Medium"
    case semibold = "Gilroy-SemiBold"
    case bold = "Gilroy-Bold"
}

extension Font {
    
    static func customfont(_ font: Inter, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension CGFloat {
    
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
    // للتعامل مع safeArea
    // بيجيب كل الشاشات (Scenes) المفتوحة في التطبيق
    static var topInsets: Double {
        if let window = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows
                .first(where: { $0.isKeyWindow }) {
            return window.safeAreaInsets.top
        }
        return 0.0
    }

    static var bottomInsets: Double {
        if let window = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows
                .first(where: { $0.isKeyWindow }) {
            return window.safeAreaInsets.bottom
        }
        return 0.0
    }

    static var horizontalInsets: Double {
        if let window = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows
                .first(where: { $0.isKeyWindow }) {
            return window.safeAreaInsets.left + window.safeAreaInsets.right
        }
        return 0.0
    }

    static var verticalInsets: Double {
        if let window = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first?.windows
                .first(where: { $0.isKeyWindow }) {
            return window.safeAreaInsets.top + window.safeAreaInsets.bottom
        }
        return 0.0
    }
    
}

extension Color {
    
    static var primaryApp: Color {
        return Color(hex: "53B175")
    }
    
    static var primaryText: Color {
        return Color(hex: "030303")
    }
    
    static var secondaryText: Color {
        return Color(hex: "828282")
    }
    
    static var textTitle: Color {
        return Color(hex: "C7C7C7")
    }

    static var placeholder: Color {
        return Color(hex: "B1B1B1")
    }
    
    static var darkGray: Color {
        return Color(hex: "4C4F4D")
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ShowEyeButton: ViewModifier {
@Binding var isShow: Bool
    public func body(content: Content) -> some View {
        HStack {
            content
            Button{
                isShow.toggle()
            }label: {
                Image(systemName: !isShow ? "eye.fill" : "eye.slash.fill")
                    .foregroundStyle(Color.textTitle )

            }
        }
    }
    
}





