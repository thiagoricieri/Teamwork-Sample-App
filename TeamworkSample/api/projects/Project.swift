//
//  Project.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import Alamofire

struct Project: ApiObject {
    
    var id = ""
    var logo = ""
    var name = ""
    var projectDescription = ""
    var starred = false
    var startDate: Date?
    var endDate: Date?
    
    init(data: Dict) {
        id = data["id"] as? String ?? ""
        logo = data["logo"] as? String ?? ""
        name = data["name"] as? String ?? ""
        projectDescription = data["description"] as? String ?? ""
        starred = data["starred"] as? Bool ?? false
        
        let _startDate = data["startDate"] as? String ?? ""
        let _endDate = data["startDate"] as? String ?? ""
        
        startDate = parseProjectDate(_startDate)
        endDate = parseProjectDate(_endDate)
    }
}

fileprivate let df = DateFormatter()
fileprivate func parseProjectDate(_ string: String) -> Date? {
    df.dateFormat = "yyyyMMdd"
    return df.date(from: string)
}
