//
//  DateUtils.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class DateUtils {
    
    fileprivate static let serverFormat = DateFormatter()
    class func parse(_ string: String) -> Date? {
        serverFormat.dateFormat = "yyyyMMdd"
        return serverFormat.date(from: string)
    }
    
    fileprivate static let humanFormat = DateFormatter()
    class func humanFormat(_ date: Date) -> String? {
        humanFormat.dateFormat = "dd/MM/yyyy"
        return humanFormat.string(from: date)
    }
}
