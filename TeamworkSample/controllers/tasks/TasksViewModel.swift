//
//  TasksViewModel.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//


import Foundation
import Alamofire

class TasksViewModel: BaseViewModel {
    
    @IBOutlet var api: TasksApi!
    
    fileprivate var tasks = [OneTaskViewModel]()
    
    var tasksCount: Int {
        get { return tasks.count }
    }
    
    func one(at: Int) -> OneTaskViewModel {
        return tasks[at]
    }
    
    func tasks(of project: String, completion: @escaping Callback) {
        defaultWillLoad?()
        api.tasks(of: project, error: defaultNetworkError) {
            [weak self] success, unsafeResult in
            guard let me = self else { return }
            guard success, let result = unsafeResult else {
                me.defaultResultError?()
                return
            }
            me.set(tasks: result)
            completion()
        }
    }
    
    fileprivate func set(tasks fromResult: AnyObject) {
        print("Tasks: \(fromResult)")
        
        guard let dict = fromResult as? Dict,
            let apiArr = dict["todo-items"] as? [Dict]
            else {
                defaultResultError?()
                return
        }
        
        tasks.removeAll()
        apiArr.forEach { taskData in
            let task = OneTaskViewModel(data: taskData)
            tasks.append(task)
        }
    }
}
