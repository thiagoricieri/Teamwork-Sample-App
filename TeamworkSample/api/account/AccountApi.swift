//
//  AccountApi.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

class AccountApi: BaseApi {
    
    func account(error: Callback?, completion: @escaping OnProcessFinished) {
        
        fetch(Router.account()) { response in
            guard receivedValidResult(response) else {
                DispatchQueue.main.async {
                    error?()
                }
                return
            }
            DispatchQueue.main.async {
                guard response.result.value != nil else {
                    completion(false, nil)
                    return
                }
                completion(true, response.result.value as AnyObject)
            }
        }
    }
}
