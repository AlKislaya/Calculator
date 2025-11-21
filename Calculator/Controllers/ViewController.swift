//
//  ViewController.swift
//  Calculator
//
//  Created by Alexandra on 20.11.25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
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
        
        if sender.titleLabel?.text == nil {
            return
        }
        
        let operation = sender.titleLabel!.text!
        var output = displayValue
        
        switch operation {
        case "AC":
            output = 0
        case "+/-":
            output *= -1
        case "%":
            output /= 100
        default:
            print("Calculation process went wrong")
        }
        
        displayValue = output
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == nil {
            return
        }
        
        let number = sender.titleLabel!.text!
        
        if isFinishedEditing {
            displayText = number
            isFinishedEditing = false
        } else {
            if number == "." {
                let currValue = displayValue
                if currValue != floor(currValue) {
                    return
                }
            }
            displayText = displayText + number
        }
    }
}
