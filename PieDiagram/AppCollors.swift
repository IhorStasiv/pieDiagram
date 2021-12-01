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
    
    //
    case greenFriends
    
    //
    case greenWork
    
    //
    case greenGrowth
    
    //
    case turquoise
    
    //
    case lightBlue
    
    //
    case darkOrange
    
    //
    case lightOrange
    
    //
    case pink
    
    //
    case violet
    
    //
    case yellow
    
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

