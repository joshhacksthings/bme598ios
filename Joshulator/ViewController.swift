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
    @IBAction func buttonPress(_ sender: UIButton) {
        disp = disp + (sender.titleLabel?.text)!
        displayEq.text = disp
    }
    
    // Decimal
    @IBAction func addDecimal(_ sender: UIButton) {
        if displayEq.text?.range(of: ".") != nil {
            disp = disp + (sender.titleLabel?.text)!
            displayEq.text = disp
        }
    }
    
    
    // Clear
    @IBAction func clearDisplay(_ sender: UIButton) {
        displayEq.text = ""
    }
    
    
}

