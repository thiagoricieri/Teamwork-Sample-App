//
//  ProjectsViewModel.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import Alamofire

class ProjectsViewModel: BaseViewModel {
    
    @IBOutlet var api: ProjectsApi!
    
    var projects = [OneProjectViewModel]()
    
    var projectsCount: Int {
        get { return projects.count }
    }
    
    func one(at: Int) -> OneProjectViewModel {
        return projects[at]
    }
    
    func allProjects(completion: @escaping Callback) {
        defaultWillLoad?()
        api.myProjects(error: defaultNetworkError) {
            [weak self] success, unsafeResult in
            guard let me = self else { return }
            guard success, let result = unsafeResult else {
                me.defaultResultError?()
                return
            }
            me.set(projects: result)
            completion()
        }
    }
    
    fileprivate func set(projects fromResult: AnyObject) {
        print("Results: \(fromResult)")
        
        guard let dict = fromResult as? Dict,
              let apiArr = dict["projects"] as? [Dict]
        else {
            defaultResultError?()
            return
        }
        
        projects.removeAll()
        apiArr.forEach { projects.append( OneProjectViewModel(data: $0) ) }
    }
}
