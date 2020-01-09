//
//  ViewController.swift
//  divisor
//
//  Created by Marcos Barbosa on 08/01/20.
//  Copyright © 2020 Marcos Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    let calculatorBrain = CalculatorBrain()
    let calculatorOnline = OnlineCalculatorBrain()
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
//        calculatorOnline.calculateWithTwoNumbers(dividend: 10, divisor: 3) { (response, error) in
//            print(response)
//        }
    }

    // MARK: - Actions
    
    @IBAction func calculateWasClicked(_ sender: Any) {
        dismissKeyboard()
    }
}

// MARK: - Extensions

extension ViewController {
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

