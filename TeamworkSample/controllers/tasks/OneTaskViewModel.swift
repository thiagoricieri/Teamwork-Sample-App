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
    var progress: Int {
        get { return model.progress }
    }
    var completed: Bool {
        get { return model.completed }
    }
    var responsiblePartyName: String {
        get {
            if model.responsiblePartyName.isEmpty {
                return "Tasks.Responsible.Anyone".localized
            }
            return model.responsiblePartyName
        }
    }
    var startToEndDate: String {
        get {
            if  let startDate = model.startDate,
                let endDate = model.endDate,
                let startFormatted = DateUtils.humanFormat(startDate),
                let endFormatted = DateUtils.humanFormat(endDate) {
                
                return "\(startFormatted) → \(endFormatted)"
            }
            return "Project.Date.NotSet".localized
        }
    }
    
    init(data: Dict) {
        self.model = Task(data: data)
    }
}
