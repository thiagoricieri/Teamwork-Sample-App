//
//  OneTaskListViewModel.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class OneTaskListViewModel: BaseViewModel {
    
    fileprivate var model: TaskList!
    
    var id: String {
        get { return model.id }
    }
    var name: String {
        get { return model.name }
    }
    var listDescription: String {
        get { return model.listDescription }
    }
    
    init(data: Dict) {
        self.model = TaskList(data: data)
    }
}
