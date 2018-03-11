//
//  ViewController.swift
//  TutCal
//
//  Created by Jasper Avtarovski on 8/3/18.
//  Copyright © 2018 PPYazi. All rights reserved.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "Null"
}

class ViewController: UIViewController {
    //Variables
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .Null
    
    // Button Functions
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            lblOut.text = runningNumber
        }
    }
    @IBAction func allClear(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .Null
        
        lblOut.text = "0"
    }
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
            runningNumber += "."
            lblOut.text = runningNumber
        }
    }
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    @IBAction func ChangeUno(_ sender: RoundButton) {
        NumeroUno.backgroundColor = UIColor.black
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // change 2 to desired number of seconds
            self.NumeroUno.backgroundColor = UIColor(red: 78, green: 78, blue: 78, alpha: 100)
        }
    }
    @IBAction func ChangeDos(_ sender: RoundButton) {
        
    }
    @IBAction func ChangeTres(_ sender: RoundButton) {
        
    }
    
    
    // Outlets
    @IBOutlet var lblOut: UILabel!
    @IBOutlet var NumeroUno: RoundButton!
    @IBOutlet var NumeroDos: RoundButton!
    @IBOutlet var NumeroTres: RoundButton!
    @IBOutlet var NumeroQuatro: RoundButton!
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblOut.text="0"
    }
    
    func operation(operation:Operation){
        if currentOperation != .Null {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                } else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                lblOut.text = result
            }
            currentOperation = operation
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

