//
//  MainStoryboard.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class MainStoryboard: StoryboardContext {
    
    struct Segue {
        static let toTasks = "toTasks"
    }
    
    override init() {
        super.init(name: "Main")
    }
    
    func projectsViewController() -> ProjectsViewController {
        return controller(name: "ProjectsViewController") as! ProjectsViewController
    }
    
    func tasksViewController() -> TasksViewController {
        return controller(name: "TasksViewController") as! TasksViewController
    }
}
