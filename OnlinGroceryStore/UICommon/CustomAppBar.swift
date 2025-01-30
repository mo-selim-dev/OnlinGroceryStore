////
////  AppBar.swift
////  OnlinGroceryStore
////
////  Created by Mohamed Selim on 30/01/2025.
////
//
//import SwiftUI
//
//// Enum لتحديد مكان النص
//enum TextAlignment {
//    case leading
//    case center
//    case trailing
//}
//
//struct CustomAppBar: View {
//    var leftIcon: Image? = nil
//    var leftAction: (() -> Void)? = nil
//    var rightIcon: Image? = nil
//    var rightAction: (() -> Void)? = nil
//    var title: String? = ""
//    var textAlignment: TextAlignment = .center
//    var font: Font = .headline
//    var colorAppBar: Color = .blue
//    var colorItems: Color = .white
//    var iconSize: CGFloat = 24
//    
//    var body: some View {
//        HStack {
//            // Left icon or button
//            if let leftIcon = leftIcon {
//                Button(action: {
//                    leftAction?()
//                }) {
//                    leftIcon
//                        .resizable()
//                        .frame(width: iconSize, height: iconSize)
//                    
//                }
//                .padding(.leading, 16)
//            } else {
//                Spacer().frame(width: iconSize) // مساحة إذا مفيش أيكون
//            }
//
//            Spacer()
//
//            // Title text with dynamic alignment
//            switch textAlignment {
//            case .leading:
//                Text(title ?? "")
//                    .font(font)
//                    .bold()
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.leading, 16)
//
//            case .center:
//                Text(title ?? "")
//                    .font(font)
//                    .bold()
//                    .frame(maxWidth: .infinity)
//                    .multilineTextAlignment(.center)
//
//            case .trailing:
//                Text(title ?? "")
//                    .font(font)
//                    .bold()
//                    .frame(maxWidth: .infinity, alignment: .trailing)
//                    .padding(.trailing, 16)
//            }
//
//            Spacer()
//
//            // Right icon or button
//            if let rightIcon = rightIcon {
//                Button(action: {
//                    rightAction?()
//                }) {
//                    rightIcon
//                        .resizable()
//                        .frame(width: iconSize, height: iconSize)
//                }
//                .padding(.trailing, 16)
//            } else {
//                Spacer().frame(width: iconSize) // مساحة إذا مفيش أيكون
//            }
//        }
//        .frame(height: 45) // ارتفاع الـAppBar
//        .padding(.top, .topInsets) // Adjust based on safe area
//        .background(colorAppBar) // لون الخلفية
//        .foregroundColor(colorItems) // لون النص والأيقونات
//    }
//}
////#Preview {
////    CustomAppBar()
////}
//



import SwiftUI

struct CustomAppBar: View {
    var leftIcon: Image? = nil
    var leftAction: (() -> Void)? = nil
    var leftIconSize: CGFloat = 24
    var leftIconColor: Color = .white

    var rightIcon: Image? = nil
    var rightAction: (() -> Void)? = nil
    var rightIconSize: CGFloat = 24
    var rightIconColor: Color = .white

    var title: String? = ""
    var textAlignment: TextAlignment = .center
    var font: Font = .headline
    var colorAppBar: Color = .blue
    var titleColor: Color = .white
    var iconSize: CGFloat = 24

    var body: some View {
        HStack {
            // Left icon or button
            if let leftIcon = leftIcon {
                Button(action: {
                    leftAction?()
                }) {
                    leftIcon
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: leftIconSize, height: leftIconSize)
                        .foregroundColor(leftIconColor)
                }
                .padding(.leading, 16)
            } else {
                Spacer().frame(width: leftIconSize)
            }

            Spacer()

            // Title text with dynamic alignment
            switch textAlignment {
            case .leading:
                Text(title ?? "")
                    .font(font)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)

            case .center:
                Text(title ?? "")
                    .font(font)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)

            case .trailing:
                Text(title ?? "")
                    .font(font)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 16)
            }

            Spacer()

            // Right icon or button
            if let rightIcon = rightIcon {
                Button(action: {
                    rightAction?()
                }) {
                    rightIcon
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: rightIconSize, height: rightIconSize)
                        .foregroundColor(rightIconColor)
                }
                .padding(.trailing, 16)
            } else {
                Spacer().frame(width: rightIconSize)
            }
        }
        .frame(height: 45)
        .padding(.top, .topInsets) // Adjust based on safe area
        .background(colorAppBar)
        .foregroundColor(titleColor)
    }
}
