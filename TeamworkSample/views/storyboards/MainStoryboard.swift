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
        static let toCreate = "toCreate"
    }
    
    override init() {
        super.init(name: "Main")
    }
    
    func createListViewController() -> UIViewController {
        return controller(name: "CreateList")
    }
}
