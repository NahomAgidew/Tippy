//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Nahom Abi on 3/12/17.
//  Copyright © 2017 Nahom Abi. All rights reserved.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipSegmentControl: UISegmentedControl!
    let defaults = UserDefaults()
    let forKey = "TIP_AMT"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipSegmentControl.selectedSegmentIndex = defaults.integer(forKey: forKey)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        defaults.set(tipSegmentControl.selectedSegmentIndex, forKey: forKey)
        defaults.synchronize()
    }

}
