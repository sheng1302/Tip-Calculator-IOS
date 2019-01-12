//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Sheng Liu on 1/9/19.
//  Copyright © 2019 Sheng Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var individualCostLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var costField: UITextField!
    @IBOutlet weak var amountPeopleField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calculateTotalCost(_ sender: Any) {

        let totalCost = calculateTotalCostHelper()
        totalCostLabel.text = String(format: "$%.2f", totalCost)
        
        let finalTip = calculateIndividualCostHelper()
        individualCostLabel.text = String(format: "$%.2f", (finalTip))
    
    }
    
    
    func calculateIndividualCostHelper() -> Double {
        
        let people = Double(amountPeopleField.text!) ?? 1
        let individualCost = Double( calculateTotalCostHelper() / people)
        
        return individualCost
    }
    
    func calculateTotalCostHelper() -> Double{
        let bill = Double(costField.text!) ?? 0
        let tip = calculateTip()
        let totalCost = bill + tip
        
        return totalCost
    }
    
    func calculateTip() -> Double{
        let bill = Double(costField.text!) ?? 0
        let tipPercentage = [0.10, 0.15, 0.20, 0.25]
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        
        return tip
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
    }
    
}

