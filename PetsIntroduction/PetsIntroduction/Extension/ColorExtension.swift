//
//  ColorExtension.swift
//  PetsIntroduction
//
//

import Foundation
import UIKit

extension UIColor {
    
    // 16진수 color입력
    convenience init(rgb: Int, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF),
            green: CGFloat((rgb >> 8) & 0xFF),
            blue: CGFloat(rgb & 0xFF),
            alpha: alpha
        )
    }
    
    // 따로 저장한 color
    convenience init(assetsColor: ConstantColor, alpha: CGFloat = 1) {
        let rgb = assetsColor.rawValue
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF),
            green: CGFloat((rgb >> 8) & 0xFF),
            blue: CGFloat(rgb & 0xFF),
            alpha: alpha
        )
    }
    
    // hex color
    static func hexStringToUIColor(hex: String) -> UIColor? {
        var cString: String = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        guard cString.count == 6 else { return nil }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
