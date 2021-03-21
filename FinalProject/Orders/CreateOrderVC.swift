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
    

    var valueFieldsArray = [String]()
    var valueFieldsIndex = 0

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
        initValues()

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
        }else if segue.identifier == "editField"{
            let editFieldVC = segue.destination as! EditFieldVC
            editFieldVC.userList = userList
            editFieldVC.ordersList = ordersList
            editFieldVC.clientsList = clientsList
            editFieldVC.userLogged = userLogged
            editFieldVC.orderIndex = orderIndex
            editFieldVC.valueFieldsIndex = valueFieldsIndex
            editFieldVC.valueFieldsArray = valueFieldsArray
        }
    }
    
    @IBAction func saveClick(_ sender: Any) {
        if inputFieldsValidated(){
            let orderObject = Order(id: orderIdLabel.text,
            client: clientField.text,
            product: paperTypeField.text,
            bgColor: bgColorField.text,
            fontColor: fontColorField.text,
            fontStyle: fontTypeField.text,
            width: Int(widthSlider.value),
            height: Int(heightSlider.value),
            quantity: Int(quantitySlider.value),
            amount: Double(totalAmountLabel.text)
            )
            if orderIndex >= 0 {
                ordersList[orderIndex] = orderObject
            }else{
                ordersList.append(orderObject)
            }
            performSegue(withIdentifier: "saveOrder", sender: self)
        }
    }

    func goToFieldValues(){
        valueFieldsArray = [
                orderIdLabel.text!,
                clientField.text!,
                paperTypeField.text! ,
                bgColorField.text! ,
                fontColorField.text! ,
                fontTypeField.text! ,
                String(widthSlider.value) ,
                String(heightSlider.value) ,
                String(quantitySlider.value),
                totalAmountLabel.text!
            ]
        performSegue(withIdentifier: "editField", sender: self)
    }
    
    func initValues(){
        if(valueFieldsArray.count > 0){
            orderIdLabel.text! = valueFieldsArray[0]
            clientField.text! = valueFieldsArray[1]
            paperTypeField.text!  = valueFieldsArray[2]
            bgColorField.text!  = valueFieldsArray[3]
            fontColorField.text!  = valueFieldsArray[4]
            fontTypeField.text!  = valueFieldsArray[5]
            widthSlider.value  = Float(Double(valueFieldsArray[6])!)
            heightSlider.value  = Float(Double(valueFieldsArray[7])!)
            quantitySlider.value = Float(Double(valueFieldsArray[8])!)
            totalAmountLabel.text = valueFieldsArray[9]
        }else{
            if orderIndex >= 0 {
                let currOrder = ordersList[orderIndex]
                orderIdLabel.text = String(format: "%06d", Int(currOrder.orderId)! + 1)
                clientField.text = currOrder.orderClient
                paperTypeField.text  = currOrder.orderProduct
                bgColorField.text  = currOrder.orderBgColor
                fontColorField.text  = currOrder.orderFontColor
                fontTypeField.text  = currOrder.orderFontStyle
                widthSlider.value  = Float(currOrder.orderWidth)
                heightSlider.value  = Float(currOrder.orderHeight)
                quantitySlider.value = Float(currOrder.orderQuantity)
                totalAmountLabel.text = String(currOrder.orderAmount)
            }else if ordersList.count > 0 {
                let lastOrder = ordersList[ordersList.count - 1].orderId
                orderIdLabel.text = String(format: "%06d", Int(lastOrder)! + 1)
            }else{
                orderIdLabel.text = String(format: "%06d", 1)
            }
            valueFieldsArray[0] = orderIdLabel.text!
            valueFieldsArray[1] = clientField.text!
            valueFieldsArray[2] = paperTypeField.text!
            valueFieldsArray[3] = bgColorField.text!
            valueFieldsArray[4] = fontColorField.text!
            valueFieldsArray[5] = fontTypeField.text!
            valueFieldsArray[6] = String(widthSlider.value)
            valueFieldsArray[7] = String(heightSlider.value)
            valueFieldsArray[8] = String(quantitySlider.value)
            valueFieldsArray[9] = totalAmountLabel.text!
        }
    }

    func inputFieldsValidated() -> Bool {
        
        return false
    }
    
}
