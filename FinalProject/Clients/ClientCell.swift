//
//  ClientCell.swift
//  FinalProject
//
//  Created by user192101 on 3/16/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class ClientCell: UITableViewCell {

    @IBOutlet weak var clientNameLabel: UILabel!
    @IBOutlet weak var clientIdLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setClientCell(client: Client){
        clientNameLabel.text = client.clientFullName
        clientIdLabel.text = client.clientIdentification
    }
    

}
