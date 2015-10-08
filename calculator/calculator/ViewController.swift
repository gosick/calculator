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
        
        print("digit is \(digit)")
    }
    

}

