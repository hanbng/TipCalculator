//
//  ViewController.swift
//  Tip Calculator
//
//  Created by nguyen thy on 5/9/20.
//  Copyright © 2020 Han Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitTableView: UITableView!
    
    let defaults = UserDefaults.standard
    
    let tipPercentages = [0.1, 0.15, 0.2]
    var individualBills = [0.0,0.0,0.0,0.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        
        splitTableView.delegate = self
        splitTableView.dataSource = self
        let height = splitTableView.frame.height
        splitTableView.rowHeight = height/4 - 10
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let tipPercentage = defaults.double(forKey: "tipPercentage")
        let index = tipPercentages.firstIndex(of: tipPercentage)
        tipControl.selectedSegmentIndex = index!
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0.00
    
        // Calculate the tip and total
        
        let index = tipControl.selectedSegmentIndex
        let tip = bill * tipPercentages[index]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f ", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        splitBill(total)
        splitTableView.reloadData()
    }
    
    func splitBill(_ bill: Double) {
        individualBills = []
        for i in 2...5 {
            let individualBill = bill/Double(i)
            individualBills.append(individualBill)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "splitCell") as! SplitCell
        cell.peopleLabel.text = String(repeating: "👤", count: indexPath.row+2)
        cell.billLabel.text = String(format: "$%.2f ", individualBills[indexPath.row])
        return cell
    }
}

