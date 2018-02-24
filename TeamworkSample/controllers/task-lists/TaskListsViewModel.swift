//
//  TaskListsViewModel.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import Alamofire

class TaskListsViewModel: BaseViewModel {
    
    @IBOutlet var api: TasksApi!
    
    var lists = [OneTaskListViewModel]()
    
    var listsCount: Int {
        get { return lists.count }
    }
    
    func one(at: Int) -> OneTaskListViewModel {
        return lists[at]
    }
    
    func lists(of project: String, completion: @escaping Callback) {
        defaultWillLoad?()
        api.lists(of: project, error: defaultNetworkError) {
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
              let apiArr = dict["tasklists"] as? [Dict]
        else {
            defaultResultError?()
            return
        }
        
        lists.removeAll()
        apiArr.forEach { lists.append( OneTaskListViewModel(data: $0) ) }
    }
}
