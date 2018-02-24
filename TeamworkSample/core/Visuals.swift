//
//  File.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

struct Visuals {
    
    static let textColor = UIColorFromRGB(rgb: 0x31455C)
    static let lightTextColor = UIColorFromRGB(rgb: 0xa5b9d1)
    static let tintColor = UIColorFromRGB(rgb: 0x86E6FB)
    static let secondaryBackgroundColor = UIColorFromRGB(rgb: 0x7087a3)
    static let navigationBarColor = UIColorFromRGB(rgb: 0x3D5673)
    static let navigationBarColorDark = UIColorFromRGB(rgb: 0x31455C)
    static let lightBackgroundColor = UIColorFromRGB(rgb: 0xEFEFF4)
    
    struct Projects {
        static let badgeBorderColor = UIColorFromRGB(rgb: 0x7087a3)
        static let starredIcon = "starred"
        static let nonStarredIcon = "non-starred"
    }
    
    struct Tasks {
        static let progressColor = UIColorFromRGB(rgb: 0x1D8CEB)
    }
}

func UIColorFromRGB(rgb: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgb & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
