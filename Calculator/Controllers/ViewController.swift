//
//  ViewController.swift
//  Calculator
//
//  Created by Alexandra on 20.11.25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculator = CalculatorLogic()
    
    private var isFinishedEditing: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var displayText: String {
        get {
            return displayLabel.text!
        }
        set {
            displayLabel.text = newValue
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedEditing = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
 
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == nil {
            return
        }
        
        let number = sender.currentTitle!
        
        if isFinishedEditing {
            displayLabel.text = number
            isFinishedEditing = false
        } else {
            if number == Constants.Calculation.Operation.point &&  floor(displayValue) != displayValue {
                return
            }
            displayLabel.text = displayLabel.text! + number
        }
    }
}
