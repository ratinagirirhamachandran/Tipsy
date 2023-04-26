//
//  ViewController.swift
//  Tipsy
//
//  Created by Ratinagiri Rhamachandran on 10/22/16.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    var decimalTip: Float?

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
   
    @IBAction func tipChanged(_ sender: UIButton) {
        calculatorBrain.getTotalAmount(userEnteredAmount: billTextField.text!)
        calculatorBrain.getDecimalTip(userInput: sender.currentTitle!)
        if sender.currentTitle! == "0%"{
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }else if sender.currentTitle! == "10%"{
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }else{
            twentyPctButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = calculatorBrain.getNumberOfPersons(valueSelectedByTheUser: sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalValue = String(format: "%.2f", calculatorBrain.getSharePerHead())
            destinationVC.displayMessage = calculatorBrain.getDisplayMessage()
        }
    }
    
}

