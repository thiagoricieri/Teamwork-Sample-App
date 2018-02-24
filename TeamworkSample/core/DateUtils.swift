//
//  DateUtils.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class DateUtils {
    
    fileprivate static let serverFormat: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyyMMdd"
        return df
    }()
    class func parse(_ string: String) -> Date? {
        return serverFormat.date(from: string)
    }
    
    fileprivate static let humanFormat: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        return df
    }()
    class func humanFormat(_ date: Date) -> String? {
        return humanFormat.string(from: date)
    }
    
    fileprivate static let monthDayFormat: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMM dd"
        return df
    }()
    class func monthDayFormat(_ date: Date) -> String? {
        return monthDayFormat.string(from: date)
    }
    
    fileprivate static let yearFormat: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy"
        return df
    }()
    class func yearFormat(_ date: Date) -> String? {
        return yearFormat.string(from: date)
    }
}
