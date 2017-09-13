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
    }

    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var displayEq: UILabel!
    let userName : String = "Josh"
    
    // Button labels: Operations
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var leftParen: UIButton!
    @IBOutlet weak var rightParen: UIButton!
    @IBOutlet weak var Divide: UIButton!
    @IBOutlet weak var Multiply: UIButton!
    @IBOutlet weak var Subtract: UIButton!
    @IBOutlet weak var Add: UIButton!
    @IBOutlet weak var Negate: UIButton!
    @IBOutlet weak var Decimal: UIButton!
    @IBOutlet weak var Evaluate: UIButton!
    
    // Button labels: Numbers
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
    // Button presses
    var disp : String = ""
    var isOperator = false
    var oper : String = ""
    @IBAction func buttonPress(_ sender: UIButton) {
        let input : String = (sender.titleLabel?.text)!
        switch input {
        case "+", "-", "/", "x":
            if isOperator {
                return
            }
            oper = input
            isOperator = true
            fallthrough
        default:
            disp = disp + (sender.titleLabel?.text)!
            displayEq.text = disp
        }
    }
    
    // Decimal
    @IBAction func addDecimal(_ sender: UIButton) {
        if !(displayEq.text?.characters.contains("."))! {
            disp = disp + (sender.titleLabel?.text)!
            displayEq.text = disp
        }
    }
    
    
    // Clear
    @IBAction func clearDisplay(_ sender: UIButton) {
        disp = ""
        isOperator = false
        oper = ""
        output.text = ""
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
            }
        }
        
        //let firstNum : String
        //let secondNum : String
        
    }
}

