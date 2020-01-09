//
//  divisorTests.swift
//  divisorTests
//
//  Created by Marcos Barbosa on 08/01/20.
//  Copyright © 2020 Marcos Barbosa. All rights reserved.
//

import XCTest
@testable import divisor

class divisorTests: XCTestCase {

    let calculatorBrain = CalculatorBrain()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTenDivideByFiveMustBeTwo() {
        calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 5) { (result, error) in
            XCTAssert(result == 2, "Result must be 2")
        }
    }
    
    func testTenDivideByZeroMustBeNil() {
       calculatorBrain.divideTwoNumbers(dividend: 10, divisor: 0) { (result, error) in
            XCTAssertNil(result, "Result must be nil")
            XCTAssert(error!.domain == "Error dividing by Zero", "Error message should be 'Error dividing by Zero'")
        }
    }
}
