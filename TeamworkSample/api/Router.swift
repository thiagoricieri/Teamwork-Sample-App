//
//  Router.swift
//  TeamworkSample
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Router
enum Router: URLRequestConvertible {
    
    static let config: RouterConfig = ProductionRouterConfig()
    
    case projects()
    
    func asURLRequest() throws -> URLRequest {
        
        var result: (path: String, method: String, parameters: Dict?) {
            switch self {
            case .projects():
                return ("/projects.json", "GET", nil)
            }
        }
        
        guard let url = Router.config.apiUrl else {
            fatalError()
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        urlRequest.setValue("BASIC \(Router.config.apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = result.method
        
        return try JSONEncoding.default.encode(urlRequest,
                                               with: result.parameters as Parameters?
        )
    }
}


func fetch(_ request: URLRequestConvertible,
           complete: @escaping InBackgroundResponse) {
    
    Alamofire
        .request(request)
        .responseJSON(
            queue: nil,
            options: .allowFragments,
            completionHandler: complete
    )
}
