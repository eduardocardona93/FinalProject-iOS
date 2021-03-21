//
//  FieldValueCell.swift
//  FinalProject
//
//  Created by user192101 on 3/19/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class FieldValueCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabel(option: String){
        valueLabel.text = option
    }

}
