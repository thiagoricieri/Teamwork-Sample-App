//
//  CompanyViewModel.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class CompanyViewModel: BaseViewModel {
    
    @IBOutlet var api: AccountApi!
    
    var account: AccountViewModel!
    
    func getAccount(completion: @escaping Callback) {
        defaultWillLoad?()
        api.account(error: defaultNetworkError) {
            [weak self] success, unsafeResult in
            guard let me = self else { return }
            guard success, let result = unsafeResult else {
                me.defaultResultError?()
                return
            }
            me.set(account: result)
            completion()
        }
    }
    
    fileprivate func set(account fromResult: AnyObject) {
        print("Results: \(fromResult)")
    
        guard let dict = fromResult as? Dict,
              let accountData = dict["account"] as? Dict
        else {
            defaultResultError?()
            return
        }
        
        account = AccountViewModel(data: accountData)
    }
}
