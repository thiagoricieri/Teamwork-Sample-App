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
    fileprivate let dateFormat = DateFormatter()
    
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
    var startToEndDate: String {
        get {
            if  let startDate = model.startDate,
                let endDate = model.endDate {
                return "\(dateFormat.string(from: startDate)) → \(dateFormat.string(from: endDate))"
            }
            return "Project.Date.NotSet".localized
        }
    }
    
    init(data: Dict) {
        self.dateFormat.dateFormat = "dd/MM/yyyy"
        self.model = Project(data: data)
    }
}
