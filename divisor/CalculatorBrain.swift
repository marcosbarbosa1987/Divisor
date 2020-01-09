//
//  CalculatorBrain.swift
//  divisor
//
//  Created by Marcos Barbosa on 09/01/20.
//  Copyright © 2020 Marcos Barbosa. All rights reserved.
//

import UIKit

class CalculatorBrain: NSObject {

    func divideTwoNumbers(dividend: Int, divisor: Int, completion:((_ result:Float?, _ error:NSError?) -> Void)) {
        
        if divisor == 0 {
            let error = NSError(domain: "Error dividing by Zero", code: 1, userInfo: nil)
            return completion(nil, error)
        }
        
        return completion(Float(dividend / divisor), nil)
    }
}
