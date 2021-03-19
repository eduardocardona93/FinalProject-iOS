//
//  CreateOrderVC.swift
//  FinalProject
//
//  Created by user192101 on 3/16/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class CreateOrderVC: UIViewController {
    var ordersList = [Order]()
    var clientsList = [Client]()
    var userList = [Salesperson]()
    var userLogged : Salesperson? = nil
    
    var orderIndex = -1
    
    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var clientField: UITextField!    
    @IBOutlet weak var paperTypeField: UITextField!    
    @IBOutlet weak var bgColorField: UITextField!    
    @IBOutlet weak var fontColorField: UITextField!    
    @IBOutlet weak var fontTypeField: UITextField!    
    @IBOutlet weak var widthSlider: UISlider!    
    @IBOutlet weak var heightSlider: UISlider!    
    @IBOutlet weak var quantitySlider: UISlider!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if orderIndex >= 0 {
            let currOrder = ordersList[orderIndex]
            
        }else if ordersList.count > 0 {
            let lastOrder = ordersList[ordersList.count - 1].orderId
            orderIdLabel.text = String(format: "%06d", Int(lastOrder)! + 1)
        }else{
            orderIdLabel.text = String(format: "%06d", 1)
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveOrder"{
            
            
            let orderVC = segue.destination as! OrdersVC
            orderVC.userList = userList
            orderVC.ordersList = ordersList
            orderVC.clientsList = clientsList
            orderVC.userLogged = userLogged
        }
    }
    
    @IBAction func saveClick(_ sender: Any) {
        if inputFieldsValidated(){
            
            
            performSegue(withIdentifier: "saveOrder", sender: self)
        }
    }
    
    func inputFieldsValidated() -> Bool {
        
        return false
    }
    
}
