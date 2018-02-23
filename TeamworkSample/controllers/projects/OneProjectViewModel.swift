//
//  OneProjectViewModel.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class OneProjectViewModel: BaseViewModel {
    
    fileprivate var model: Project!
    
    var id: String {
        get { return model.id }
    }
    var name: String {
        get { return model.name }
    }
    var logoUrl: URL? {
        get { return URL(string: model.logo) }
    }
    var projectDescription: String {
        get { return model.projectDescription }
    }
    
    init(data: Dict) {
        self.model = Project(data: data)
    }
}
