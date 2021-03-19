//
//  OrderCell.swift
//  FinalProject
//
//  Created by user192101 on 3/16/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var orderClientIdLabel: UILabel!
    @IBOutlet weak var orderAmountLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setOrder(order: Order){
        orderIdLabel.text = order.orderId
        orderClientIdLabel.text = order.orderClient
        orderAmountLabel.text = String(format: "%.2f", order.orderAmount)
    }

}
