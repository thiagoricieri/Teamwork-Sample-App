//
//  Task.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

struct Task: ApiObject {
    
    var id = ""
    var todoList = ""
    var content = ""
    var responsiblePartyName = ""
    
    init(data: Dict) {
        id = data["id"] as? String ?? ""
        content = data["content"] as? String ?? ""
        todoList = data["todo-list-name"] as? String ?? ""
        responsiblePartyName = data["responsible-party-names"] as? String ?? ""
    }
}
