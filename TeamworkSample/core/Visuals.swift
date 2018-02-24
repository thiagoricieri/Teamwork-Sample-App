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
    
    struct Tasks {
        static let progressColor = UIColor.green
    }
    
    struct Projects {
        static let badgeBorderColor = UIColorFromRGB(rgb: 0xAAAAAA)
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
