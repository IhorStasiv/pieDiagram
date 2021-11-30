//
//  AppCollors.swift
//  PieDiagram
//
//  Created by Ihor Stasiv on 30.11.2021.
//

import UIKit.UIColor

typealias Color = UIColor

extension Color {
    convenience init(rgbaValue: UInt32) {
        let red = CGFloat((rgbaValue >> 24) & 0xFF) / 255.0
        let green = CGFloat((rgbaValue >> 16) & 0xFF) / 255.0
        let blue = CGFloat((rgbaValue >> 8) & 0xFF) / 255.0
        let alpha = CGFloat(rgbaValue & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

enum AppColors {
    // MARK: - R G B
    
    // 250 247 255
    case lightGray
    
    // MARK: - 0x + HEX + alpha(FF = 1)
    
    var rgbaValue: UInt32 {
        switch self {
        case .lightGray:
            return 0xFAF7FFFF
        }
    }

    var color: Color {
        return Color(named: self)
    }
}

extension Color {
    convenience init(named name: AppColors) {
        self.init(rgbaValue: name.rgbaValue)
    }
}

