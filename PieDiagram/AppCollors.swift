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
    
    // 196 223 118
    case greenFriends
    
    // 162 235 169
    case greenWork
    
    // 99 239 185
    case greenGrowth
    
    // 88 217 207
    case turquoise
    
    // 97 189 242
    case lightBlue
    
    // 255 131 91
    case darkOrange
    
    // 255 196 128
    case lightOrange
    
    // 221 102 204
    case pink
    
    // 126 49 249
    case violet
    
    // 253 228 153
    case yellow
    
    // 237 237 237
    case dashGray
    
    // 230 217 255
    case dashViolet
    
    // 201 171 255
    case dashLightViolet
    
    // MARK: - 0x + HEX + alpha(FF = 1)
    
    var rgbaValue: UInt32 {
        switch self {
        case .lightGray:
            return 0xFAF7FFFF
        case .greenFriends:
            return 0xC4DF76FF
        case .greenWork:
            return 0xA2EBA9FF
        case .greenGrowth:
            return 0x63EFB9FF
        case .turquoise:
            return 0x58D9CFFF
        case .lightBlue:
            return 0x61BDF2FF
        case .darkOrange:
            return 0xFF835BFF
        case .lightOrange:
            return 0xFFC480FF
        case .pink:
            return 0xDD66CCFF
        case .violet:
            return 0x7E31F9FF
        case .yellow:
            return 0xFDE499FF
        case .dashGray:
            return 0xEDEDEDFF
        case .dashViolet:
            return 0xC9ABFFFF
        case .dashLightViolet:
            return 0xE6D9FFFF
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

