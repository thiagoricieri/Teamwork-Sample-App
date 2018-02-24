//
//  BaseViewModel.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class BaseViewModel: NSObject {
    
    public var defaultWillLoad: Callback?
    public var defaultNetworkError: Callback?
    public var defaultResultError: Callback?
}
