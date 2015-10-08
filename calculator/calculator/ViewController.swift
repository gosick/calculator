//
//  ViewController.swift
//  calculator
//
//  Created by gosick on 2015/10/8.
//  Copyright © 2015年 gosick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var display: UILabel!

    var userIsTypingNow = false
    
    @IBAction func digitAppend(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsTypingNow {
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            userIsTypingNow = true
        }
        
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enterKey() {
        
        userIsTypingNow = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsTypingNow = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        
        if userIsTypingNow {
            enterKey()
        }

        switch operation {
        
            case "+": performOperation{ $0 + $1 }
            case "−": performOperation{ $1 - $0 }
            case "×": performOperation{ $0 * $1 }
            case "÷": performOperation{ $1 / $0 }
            case "√": performOperation{ sqrt($0) }
            default: break
        }
        
    }

    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enterKey()
        }
    }
    
    @nonobjc
    
    func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enterKey()
        }
    }
    
}

