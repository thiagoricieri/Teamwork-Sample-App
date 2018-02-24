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
    var startDate: Date? {
        get { return model.startDate }
    }
    var endDate: Date? {
        get { return model.endDate }
    }
    var projectDescription: String {
        get { return model.projectDescription }
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
        self.model = Project(data: data)
    }
}
