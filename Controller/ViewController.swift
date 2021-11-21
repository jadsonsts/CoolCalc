//
//  ViewController.swift
//  CoolCalc
//
//  Created by Jadson on 15/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishingTypingNumber = true
    
    private var calculator = Calculator()
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a number")
            }
            return number
        } set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: CalcButton) {
        isFinishingTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: CalcButton) {
       
        if let numValue = sender.currentTitle {
            if isFinishingTypingNumber {
                displayLabel.text = numValue
                isFinishingTypingNumber = false
            } else {
                
                if numValue == "." {
                    //round the number down and compare with the number sent
                    let isInt = floor(displayValue) == displayValue
                    
                    //if true, returns the number itself
                    if !isInt {
                        return //to stop adding the decimal dot
                    }
                }
                displayLabel.text?.append(numValue)
            }
        }
    }
    
}

