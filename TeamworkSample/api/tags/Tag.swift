//
//  Tag.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

struct Tag: ApiObject {
    
    var name = ""
    
    init(data: Dict) {
        name = data["name"] as? String ?? ""
    }
}
