//
//  TodoList.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

struct TodoList: ApiObject {
    
    var name = ""
    
    init(name: String) {
        self.name = name
    }
}
