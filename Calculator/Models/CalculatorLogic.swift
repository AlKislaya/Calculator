//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Alexandra on 21.11.25.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
       
        if let n = number {
            switch symbol {
            case Constants.Calculation.Operation.plusMinus:
                return n * -1
            case Constants.Calculation.Operation.AC:
                return 0
            case Constants.Calculation.Operation.percent:
                return n * 0.01
            case Constants.Calculation.Operation.equal:
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case Constants.Calculation.Operation.plus:
                return n1 + n2
            case Constants.Calculation.Operation.minus:
                return n1 - n2
            case Constants.Calculation.Operation.multiply:
                return n1 * n2
            case Constants.Calculation.Operation.divide:
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
