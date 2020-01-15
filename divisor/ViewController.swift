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
        
        calculatorOnline.calculateWithTwoNumbers(dividend: 100, divisor: 21) { (response, error) in
            print(response)
        }
    }

    // MARK: - Actions
    
    @IBAction func calculateWasClicked(_ sender: Any) {
        dismissKeyboard()
        
        guard let firstNumber = firstNumberTextField.text, firstNumber.count > 0 else {
            alert(message: "Type first number!")
            return
        }
        
        guard let secondNumber = secondNumberTextField.text, secondNumber.count > 0 else {
            alert(message: "Type second number!")
            return
        }
        
        guard let doubleFirstNumber = Int(firstNumber) else {
            alert(message: "First textfield there is not a number!")
            return
        }
        
        guard let doubleSecondNumber = Int(secondNumber) else {
            alert(message: "Second textfield there is not a number!")
            return
        }
        
        let _ = calculatorBrain.divideTwoNumbers(dividend: doubleFirstNumber, divisor: doubleSecondNumber) { (result, error) in
            if error != nil {
                self.alert(message: error?.domain ?? "")
            } else {
                resultLabel.text = "\(String(describing: result ?? 0.0))"
            }
        }
        
    }
}

// MARK: - Extensions

extension ViewController {
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func alert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

