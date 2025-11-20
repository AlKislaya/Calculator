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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedEditing = true
        
        if sender.titleLabel?.text == nil {
            return
        }
        
        let titleNumber = sender.titleLabel!.text!
        
        guard let number = Double(titleNumber) else {
            fatalError("Cannot convert display label text to a Double")
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == nil {
            return
        }
        
        let number = sender.titleLabel!.text!
        
        if isFinishedEditing {
            displayLabel.text = number
            isFinishedEditing = false
        } else {
            displayLabel.text = displayLabel.text! + number
        }
    }
}
