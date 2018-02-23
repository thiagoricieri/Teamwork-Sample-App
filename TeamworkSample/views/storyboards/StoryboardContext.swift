//
//  StoryboardContext.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import UIKit

class StoryboardContext {
    
    var storyboard: UIStoryboard!
    
    init(){}
    init(name: String){
        storyboard = UIStoryboard(name: name, bundle: nil)
    }
    
    func controller(name: String) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: name)
    }
    
    func firstController() -> UIViewController {
        return storyboard.instantiateInitialViewController()!
    }
}
