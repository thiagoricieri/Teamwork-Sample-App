//
//  Types.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Alamofire

typealias Dict = [String: AnyObject]
typealias InBackgroundResponse = (DataResponse<Any>) -> Void
typealias OnProcessFinished = (Bool, AnyObject?) -> Void
typealias Callback = () -> Void
