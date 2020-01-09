//
//  OnlineCalculatorTest.swift
//  divisorTests
//
//  Created by Marcos Barbosa on 09/01/20.
//  Copyright © 2020 Marcos Barbosa. All rights reserved.
//

import XCTest

class OnlineCalculatorTest: XCTestCase {

    let onlineCalculatorBrain = OnlineCalculatorBrain()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testRetriveURLForTenDivideByTwo() {
        let url = NSURL(string: "https://api.mathjs.org/v4/?expr=(10)/(2)")
        let response = onlineCalculatorBrain.retriveURLForDivision(dividend: 10, divisor: 2)
        XCTAssert(url == response, "URL must be equals to 'https://api.mathjs.org/v4/?expr=(10)/(2)'")
    }
    
    func testRetriveURLForTenDivideByTwoShouldFail() {
           let url = NSURL(string: "https://api.mathjs.org/v4/?expr=(10)/(2)")
           let response = onlineCalculatorBrain.retriveURLForDivision(dividend: 20, divisor: 2)
           XCTAssert(url != response, "URL must be equals to 'https://api.mathjs.org/v4/?expr=(10)/(2)'")
    }

    func testCalculatorDivisionOnlineFor10DivideByTwoShouldBeFive() {
       
        onlineCalculatorBrain.calculateWithTwoNumbers(dividend: 10, divisor: 1) { (response, error) in
            XCTAssert(response == 5, "Response should be 5")
        }
    }
    
    func testCalculateDivisionByZero() {
        
        let expect = expectation(description: "Expected callback from API fail")
        
        onlineCalculatorBrain.calculateWithTwoNumbers(dividend: 10, divisor: 0) { (response, error) in
            
            if error == nil {
                XCTFail()
            } else {
                XCTAssert(error?.domain == "Division by Zero", "Response should be 'Division by Zero'")
                expect.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
}
