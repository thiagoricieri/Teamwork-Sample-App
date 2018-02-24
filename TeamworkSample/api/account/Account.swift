//
//  Account.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

struct Account: ApiObject {
    
    var name = ""
    var companyName = ""
    var logo = ""
    
    init(data: Dict) {
        name = data["name"] as? String ?? ""
        companyName = data["companyname"] as? String ?? ""
        logo = data["logo"] as? String ?? ""
    }
}
