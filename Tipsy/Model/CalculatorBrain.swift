//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Ratinagiri Rhamachandran on 10/22/16.
//

import Foundation

//var billAndTip: BillAndTip?

struct CalculatorBrain {
    
    var totalAmount: Float = 0.0
    var FloatNumberOfPersons: Float = 0.0
    var numberOfPersons = ""
    var decimalTip: Float = 0.0
    var tipPercentage = 0

    mutating func getNumberOfPersons(valueSelectedByTheUser: Double) -> String {
        FloatNumberOfPersons = Float(valueSelectedByTheUser)
        numberOfPersons = String(format: "%.0f", valueSelectedByTheUser)
        return numberOfPersons
    }
    
    mutating func getTotalAmount(userEnteredAmount: String) {
       totalAmount = Float(userEnteredAmount) ?? 0.0
    }
    
    mutating func getDecimalTip(userInput: String) {
        if userInput == "0%"{
            decimalTip = 0.0
            tipPercentage = 0
        } else if userInput == "10%" {
            decimalTip = 0.1
            tipPercentage = 10
        } else {
            decimalTip = 0.2
            tipPercentage = 20
        }
        
    }
    
    func getSharePerHead() -> Float {
        print(totalAmount)
        print(decimalTip)
        print(FloatNumberOfPersons)

        var sharePerHead = (totalAmount + (decimalTip * totalAmount)) / FloatNumberOfPersons
        return sharePerHead
    }
    
    func getDisplayMessage() -> String {
        return "Split between \(numberOfPersons) people, with a \(tipPercentage)% tip."
    }
}
