//
//  OnlineCalculatorBrain.swift
//  divisor
//
//  Created by Marcos Barbosa on 09/01/20.
//  Copyright © 2020 Marcos Barbosa. All rights reserved.
//

import UIKit

class OnlineCalculatorBrain: NSObject {

    func retriveURLForDivision(dividend: Int, divisor: Int) -> NSURL {
        return NSURL(string: "https://api.mathjs.org/v4/?expr=(\(dividend))/(\(divisor))")!
    }
    
    func calculateWithTwoNumbers(dividend: Int, divisor: Int, completionHandler: @escaping(Float?, NSError?) -> ()) {
        
        if divisor == 0 {
            let error = NSError(domain: "Division by Zero", code: 1, userInfo: nil)
            completionHandler(nil, error)
        }
        
        let url = retriveURLForDivision(dividend: dividend, divisor: divisor)
        let session = URLSession.shared
        
        let tast = session.dataTask(with: url as URL) { (data, response, error) in
            
            if error == nil {
                if let result = data {
                    let value = NSString(data: result, encoding: String.Encoding.utf8.rawValue)
                    completionHandler(value?.floatValue, nil)
                }
                
                let localError = NSError(domain: "No data was found", code: 1, userInfo: nil)
                completionHandler(nil, localError)
                
            } else {
                print(error!.localizedDescription)
                completionHandler(nil, error as! NSError)
            }
        }
        tast.resume()
    }
}
