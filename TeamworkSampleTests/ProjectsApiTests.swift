//
//  TeamworkTestProjects.swift
//  TeamworkSampleTests
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import XCTest
@testable import TeamworkSample

class ProjectsApiTests: XCTestCase {
    
    var api: ProjectsApi!
    
    override func setUp() {
        super.setUp()
        api = ProjectsApi()
    }
    
    override func tearDown() {
        api = nil
        super.tearDown()
    }
    
    func testApiResponse_GetProjects() {
        let expectedKey = "projects"
        let hasAccountKey = expectation(description: "Returns an object with '\(expectedKey)' key")
        let hasRequiredProperties = expectation(description: "Project object has required properties")
        
        api.myProjects (
            error: {
                XCTFail("Error while downloading.")
            },
            completion: { success, result in
                guard success else {
                    XCTFail("Operation didn't succeed")
                    return
                }
                guard let dict = result as? Dict else {
                    XCTFail("Projects API returned an invalid object")
                    return
                }
                guard let lists = dict[expectedKey] as? [Dict] else  {
                    XCTFail("Projects API result does not have a '\(expectedKey)' key.")
                    return
                }
                hasAccountKey.fulfill()
                
                guard let one = lists.first,
                    let _ = one["id"] as? String,
                    let _ = one["logo"] as? String,
                    let _ = one["starred"] as? Int,
                    let _ = one["name"] as? String,
                    let _ = one["description"] as? String
                else {
                    XCTFail("Projects object does not contain required properties.")
                    return
                }
                
                hasRequiredProperties.fulfill()
            }
        )
        
        waitForExpectations(timeout: 20)
    }
}

