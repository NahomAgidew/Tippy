//
//  ViewController.swift
//  Tippy
//
//  Created by Nahom Abi on 3/12/17.
//  Copyright © 2017 Nahom Abi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults()
    let forKey = "TIP_AMT"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tipControl.selectedSegmentIndex = defaults.integer(forKey: forKey)
        billField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        calcTip()
    }
    
    @IBAction func onSegmentSelectedChange(_ sender: Any) {
        calcTip()
    }
    
    func calcTip() {
        tipLabel.alpha = 0
        totalLabel.alpha = 0
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!)	 ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        UIView.animate(withDuration: 0.4, animations: {
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
        })
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

