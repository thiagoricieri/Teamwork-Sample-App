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
    var startDate: Date?
    var endDate: Date?
    var completed = false
    var progress = 0
    
    init(data: Dict) {
        id = data["id"] as? String ?? ""
        content = data["content"] as? String ?? ""
        todoList = data["todo-list-name"] as? String ?? ""
        responsiblePartyName = data["responsible-party-names"] as? String ?? ""
        completed = data["completed"] as? Bool ?? false
        progress = data["progress"] as? Int ?? 0
        
        let _startDate = data["startDate"] as? String ?? ""
        let _endDate = data["startDate"] as? String ?? ""
        
        startDate = DateUtils.parse(_startDate)
        endDate = DateUtils.parse(_endDate)
    }
}
