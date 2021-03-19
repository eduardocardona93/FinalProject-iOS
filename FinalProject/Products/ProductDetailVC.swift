//
//  ProductDetailVC.swift
//  FinalProject
//
//  Created by user192101 on 3/17/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {
    var ordersList = [Order]()
    var clientsList = [Client]()
    var userList = [Salesperson]()
    var userLogged : Salesperson? = nil
    var selectedProduct : Product? = nil
    
    
    @IBOutlet weak var prodIdLabel: UILabel!
    
    @IBOutlet weak var prodNameLabel: UILabel!
    @IBOutlet weak var prodPriceLabel: UILabel!
    @IBOutlet weak var prodDescText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        prodPriceLabel.text = "$ " + String(format: "%.2f", selectedProduct!.prodPrice)
        prodIdLabel.text = String(selectedProduct!.prodId)
        prodNameLabel.text = selectedProduct!.prodName
        prodDescText.text = selectedProduct!.prodDescription
        // prodDescText.text = String(selectedProduct!.prodId)
        
        




        // Do any additional setup after loading the view.
    }
    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let productVC = segue.destination as! ProductVC
        productVC.userList = userList
        productVC.ordersList = ordersList
        productVC.clientsList = clientsList
        productVC.userLogged = userLogged
    }
    

}
