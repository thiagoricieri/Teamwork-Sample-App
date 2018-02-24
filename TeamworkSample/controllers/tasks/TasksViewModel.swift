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
    
    typealias TodoAndTask = (todo: TodoList, tasks: [OneTaskViewModel])
    
    @IBOutlet var api: TasksApi!
    
    var tasksCollection = [TodoAndTask]()
    
    var sectionsCount: Int {
        get { return tasksCollection.count }
    }
    
    func section(at: Int) -> TodoList {
        return tasksCollection[at].todo
    }
    
    func countTasks(section: Int) -> Int {
        return tasksCollection[section].tasks.count
    }
    
    func one(at: Int, section: Int) -> OneTaskViewModel {
        return tasksCollection[section].tasks[at]
    }
    
    func tasks(of project: String, completion: @escaping Callback) {
        defaultWillLoad?()
        api.tasks(ofProject: project, error: defaultNetworkError) {
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
        
        tasksCollection.removeAll()
        apiArr.forEach { taskData in
            let task = OneTaskViewModel(data: taskData)
            guard let index = self.tasksCollection.index(where: { $0.todo.name == task.todoListName }) else {
                let section = TodoAndTask(todo: TodoList(name: task.todoListName), tasks: [task])
                self.tasksCollection.append(section)
                return
            }
            self.tasksCollection[index].tasks.append(task)
        }
    }
}
