//
//  Task.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

struct TaskList: ApiObject {
    
    var id = ""
    var name = ""
    var listDescription = ""
    
    init(data: Dict) {
        id = data["id"] as? String ?? ""
        name = data["name"] as? String ?? ""
        listDescription = data["description"] as? String ?? ""
    }
}
