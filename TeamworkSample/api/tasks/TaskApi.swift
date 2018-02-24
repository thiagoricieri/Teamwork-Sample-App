//
//  TaskApi.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class TasksApi: BaseApi {
    
    func lists(of project: String,
               error: Callback?,
               completion: @escaping OnProcessFinished) {
        
        fetch(Router.lists(projectId: project)) { response in
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
    
    func tasks(of taskList: String,
               error: Callback?,
               completion: @escaping OnProcessFinished) {
        
        fetch(Router.tasks(listId: taskList)) { response in
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
