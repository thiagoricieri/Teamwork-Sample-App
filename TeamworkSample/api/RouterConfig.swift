//
//  RouterConfig.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation

protocol RouterConfig {
    var apiUrl: URL? { get }
    var apiKey: String { get }
}

struct ProductionRouterConfig: RouterConfig {
    
    var apiUrl: URL?
    var apiKey: String = ""
    
    init() {
        if let path = Bundle.main.path(forResource: "Teamwork", ofType: "plist") {
            if let plist = NSDictionary(contentsOfFile: path) {
                let tempApiKey = plist["apiKey"] as? String ?? ""
                apiUrl = URL(string: plist["apiUrl"] as? String ?? "")
                
                guard let apiKeyData = tempApiKey.data(using: .utf8) else {
                    fatalError()
                }
                apiKey = apiKeyData.base64EncodedString()
            }
        }
    }
}
