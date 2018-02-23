//
//  ProjectApi.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class ProjectsApi: BaseApi {
    
    func myProjects(error: Callback?, completion: @escaping OnProcessFinished) {
        fetch(Router.projects()) { response in
            guard receivedValidResult(response) else {
                DispatchQueue.main.async {
                    error?()
                }
                return
            }
            DispatchQueue.main.async {
                guard response.result.value != nil else {
                    completion(false, nil)
                    return
                }
                completion(true, response.result.value as AnyObject)
            }
        }
    }
}
