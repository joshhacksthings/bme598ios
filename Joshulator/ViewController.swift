//
//  ViewController.swift
//  Joshulator
//
//  Created by Joshua Nowak on 9/11/17.
//  Copyright © 2017 Joshua Nowak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.output.text = disp
        self.displayEq.text = disp
    }

    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var displayEq: UILabel!
    
    
    // Button presses
    var disp : String = ""
    var isOperator = false
    var oper : String = ""
    var hasDecimal = false
    @IBAction func buttonPress(_ sender: UIButton) {
        let input : String = (sender.titleLabel?.text)!
        switch input {
        case "+/-":
            if !isOperator {
                disp = "-" + disp
                displayEq.text = disp
            }
        case "+", "-", "/", "x":
            if isOperator {
                return
            }
            oper = input
            isOperator = true
            hasDecimal = false
            fallthrough
        default:
            disp = disp + input
            displayEq.text = disp
        }
    }
    
    // Decimal
    @IBAction func addDecimal(_ sender: UIButton) {
        if !hasDecimal {
            disp = disp + (sender.titleLabel?.text)!
            displayEq.text = disp
            hasDecimal = true
        }
    }
    
    
    // Clear
    @IBAction func clearDisplay(_ sender: UIButton) {
        disp = ""
        isOperator = false
        oper = ""
        output.text = ""
        hasDecimal = false
        displayEq.text = disp
    }
    
    // Calculate equation
    @IBAction func doCalc(_ sender: UIButton) {
        let eq : String = (displayEq.text)!
        if isOperator {
            for index in eq.characters.indices {
                switch eq[index] {
                case "+":
                    let firstNum : Double = Double(eq.substring(to: index))!
                    let secondNum : Double = Double(eq.substring(from: eq.index(after: index)))!
                    disp = String(firstNum + secondNum)
                case "-":
                    let firstNum : Double = Double(eq.substring(to: index))!
                    let secondNum : Double = Double(eq.substring(from: eq.index(after: index)))!
                    disp = String(firstNum - secondNum)
                case "/":
                    let firstNum : Double = Double(eq.substring(to: index))!
                    let secondNum : Double = Double(eq.substring(from: eq.index(after: index)))!
                    disp = String(firstNum / secondNum)
                case "x":
                    let firstNum : Double = Double(eq.substring(to: index))!
                    let secondNum : Double = Double(eq.substring(from: eq.index(after: index)))!
                    disp = String(firstNum * secondNum)
                default:
                    displayEq.text = disp;
                }
                displayEq.text = disp
                output.text = disp;
                isOperator = false
                oper = ""
                hasDecimal = false
            }
        }
        
        //let firstNum : String
        //let secondNum : String
        
    }
}

