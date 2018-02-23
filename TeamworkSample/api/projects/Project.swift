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
    
    init(data: Dict) {
        id = data["id"] as? String ?? ""
        logo = data["logo"] as? String ?? ""
        name = data["name"] as? String ?? ""
        projectDescription = data["description"] as? String ?? ""
    }
}
