//
//  OneTaskViewModel.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class OneTaskViewModel: BaseViewModel {
    
    fileprivate var model: Task!
    
    var id: String {
        get { return model.id }
    }
    var content: String {
        get { return model.content }
    }
    var todoListName: String {
        get { return model.todoList }
    }
    var responsiblePartyName: String {
        get {
            if model.responsiblePartyName.isEmpty {
                return "Tasks.Responsible.Anyone".localized
            }
            return model.responsiblePartyName
        }
    }
    
    init(data: Dict) {
        self.model = Task(data: data)
    }
}
