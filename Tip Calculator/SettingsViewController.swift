//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by nguyen thy on 5/9/20.
//  Copyright © 2020 Han Nguyen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var darkModeControl: UISwitch!
    
    let defaults = UserDefaults.standard
    let tipPercentages = [0.1, 0.15, 0.2]
    var tipPercentage = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentage = defaults.double(forKey: "tipPercentage")
        let index = tipPercentages.firstIndex(of: tipPercentage)
        tipControl.selectedSegmentIndex = index ?? 0
        
        let isDarkMode = defaults.bool(forKey: "darkMode")
        if isDarkMode {
            darkModeControl.isOn = true
        } else {
            darkModeControl.isOn = false
        }
    }
    
    @IBAction func chooseTip(_ sender: Any) {
        let index = tipControl.selectedSegmentIndex
        tipPercentage = tipPercentages[index]
        
        defaults.set(tipPercentage, forKey: "tipPercentage")
        defaults.synchronize()
        
    }
    
    @IBAction func switchTheme(_ sender: Any) {
        if darkModeControl.isOn {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
            defaults.set(true, forKey: "darkMode")
        } else {
            UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = .light
            }
            defaults.set(false, forKey: "darkMode")
        }
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
