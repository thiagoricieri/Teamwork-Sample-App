//
//  TeamworkSampleTests.swift
//  TeamworkSampleTests
//
//  Created by Thiago Ricieri on 23/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import XCTest
@testable import TeamworkSample

class TaskApiTests: XCTestCase {
    
    var api: TasksApi!
    
    override func setUp() {
        super.setUp()
        api = TasksApi()
    }
    
    override func tearDown() {
        api = nil
        super.tearDown()
    }
    
    func testApiResponse_GetTaskLists() {
        let expectedKey = "tasklists"
        let hasAccountKey = expectation(description: "Returns an object with '\(expectedKey)' key")
        let hasRequiredProperties = expectation(description: "Account object has required properties")
        let validProjectId = "339988"
        
        api.lists(
            of: validProjectId,
            error: {
                XCTFail("Error while downloading.")
            },
            completion: { success, result in
                guard success else {
                    XCTFail("Operation didn't succeed")
                    return
                }
                guard let dict = result as? Dict else {
                    XCTFail("Account API returned an invalid object")
                    return
                }
                guard let lists = dict[expectedKey] as? [Dict] else  {
                    XCTFail("Account API does not have a '\(expectedKey)' key.")
                    return
                }
                hasAccountKey.fulfill()
                
                guard let one = lists.first,
                    let _ = one["id"] as? String,
                    let _ = one["name"] as? String,
                    let _ = one["description"] as? String
                else {
                    XCTFail("List object does not contain required properties.")
                    return
                }
                
                hasRequiredProperties.fulfill()
            }
        )
        
        waitForExpectations(timeout: 10)
    }
    
    func testApiResponse_GetTasks() {
        let expectedKey = "todo-items"
        let hasAccountKey = expectation(description: "Returns an object with '\(expectedKey)' key")
        let hasRequiredProperties = expectation(description: "Account object has required properties")
        let validTaskListId = "1499279"
        
        api.tasks(
            of: validTaskListId,
            error: {
                XCTFail("Error while downloading.")
            },
            completion: { success, result in
                guard success else {
                    XCTFail("Operation didn't succeed")
                    return
                }
                guard let dict = result as? Dict else {
                    XCTFail("Account API returned an invalid object")
                    return
                }
                guard let tasks = dict[expectedKey] as? [Dict] else  {
                    XCTFail("Account API does not have a '\(expectedKey)' key.")
                    return
                }
                hasAccountKey.fulfill()
                
                guard let one = tasks.first,
                    let _ = one["id"] as? Int,
                    let _ = one["content"] as? String,
                    let _ = one["responsible-party-names"] as? String,
                    let _ = one["completed"] as? Int,
                    let progress = one["progress"] as? Int
                else {
                    XCTFail("Task object does not contain required properties.")
                    return
                }
                
                guard progress >= 0, progress <= 100 else {
                    XCTFail("Progress must be a number between 0 and 100.")
                    return
                }
                
                hasRequiredProperties.fulfill()
            }
        )
        
        waitForExpectations(timeout: 10)
    }
}
