//
//  AccountViewModel.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class AccountViewModel: BaseViewModel {
    
    fileprivate var model: Account!
    
    var name: String {
        get { return model.name }
    }
    var companyName: String {
        get { return model.companyName }
    }
    var logo: URL? {
        get { return URL(string: model.logo) }
    }
    
    init(data: Dict) {
        self.model = Account(data: data)
    }
}
