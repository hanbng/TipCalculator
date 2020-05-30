//
//  SplitCell.swift
//  Tip Calculator
//
//  Created by nguyen thy on 5/9/20.
//  Copyright © 2020 Han Nguyen. All rights reserved.
//

import UIKit

class SplitCell: UITableViewCell {

    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
