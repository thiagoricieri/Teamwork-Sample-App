//
//  Project.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import Alamofire

class Project: ApiObject {
    
    class func all(completion: @escaping InBackgroundResponse) {
        fetch(Router.projects(), complete: completion)
    }
}
