//
//  Calculator.swift
//  CoolCalc
//
//  Created by Jadson on 15/11/21.
//

import UIKit

struct Calculator {
    
    //set as optional because at the beginning it could be nil, user didn't press anything
    var number: Double?
    
    //use touple to storage the 1st number and the calculation method
    var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber (_ number: Double) {
        self.number = number
    }
    
    //this function will format the number acording to the symbol selected
    mutating func calculate (symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalc(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalc(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("This operation does not match any of cases")
            }
        }
        return nil
    }
}
