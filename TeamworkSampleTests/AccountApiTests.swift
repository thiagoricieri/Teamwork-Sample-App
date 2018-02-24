//
//  TeamworkTestTasks.swift
//  TeamworkSampleTests
//
//  Created by Thiago Ricieri on 24/02/2018.
//  Copyright © 2018 Thiago Ricieri. All rights reserved.
//

import XCTest
@testable import TeamworkSample

class AccountApiTests: XCTestCase {
    
    var api: AccountApi!
    
    override func setUp() {
        super.setUp()
        api = AccountApi()
    }
    
    override func tearDown() {
        api = nil
        super.tearDown()
    }
    
    func testReceiveData() {
        let hasAccountKey = expectation(description: "Returns an object with 'account' key")
        let hasRequiredProperties = expectation(description: "Account object has required properties")
        
        api.account(
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
                guard let account = dict["account"] as? Dict else  {
                    XCTFail("Account API does not have a 'account' key.")
                    return
                }
                hasAccountKey.fulfill()
                
                guard let _ = account["name"] as? String,
                      let _ = account["companyname"] as? String,
                      let _ = account["logo"] as? String
                else {
                    XCTFail("Account object does not contain required properties.")
                    return
                }
                hasRequiredProperties.fulfill()
            }
        )
        
        waitForExpectations(timeout: 10)
    }
}

