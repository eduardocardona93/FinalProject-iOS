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
    var producstList = [Product]()
    var orderIndex = -1
    
    var valueFieldsArray = [String]()
    var valueFieldsIndex = 0
    
    var height = 1.0
    var width = 36.0
    var quantity = 1
    var totalAmount = 0.0
    var pricePerSqft = 0.0

    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var clientField: UITextField!    
    @IBOutlet weak var paperTypeField: UITextField!    
    @IBOutlet weak var bgColorField: UITextField!    
    @IBOutlet weak var fontColorField: UITextField!    
    @IBOutlet weak var fontTypeField: UITextField!    
    @IBOutlet weak var widthSlider: UISlider!    
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var quantitySlider: UISlider!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var totalAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLbl.text = ""
        initValues()

        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    	
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveOrder" || segue.identifier == "returnOrders"{
            let orderVC = segue.destination as! OrdersVC
            orderVC.userList = userList
            orderVC.ordersList = ordersList
            orderVC.clientsList = clientsList
            orderVC.userLogged = userLogged
            orderVC.producstList = producstList
        }else if segue.identifier == "editField"{
            let editFieldVC = segue.destination as! EditFieldVC
            editFieldVC.userList = userList
            editFieldVC.ordersList = ordersList
            editFieldVC.clientsList = clientsList
            editFieldVC.userLogged = userLogged
            editFieldVC.orderIndex = orderIndex
            editFieldVC.producstList = producstList
            editFieldVC.valueFieldsIndex = valueFieldsIndex
            editFieldVC.valueFieldsArray = valueFieldsArray
        }
    }
    
    @IBAction func saveClick(_ sender: Any) {
        if inputFieldsValidated(){
            let orderObject = Order(
                id:orderIdLabel.text! ,
                client: clientField.text! ,
                product:paperTypeField.text! ,
                bgColor:bgColorField.text! ,
                fontColor:fontColorField.text! ,
                fontStyle:fontTypeField.text! ,
                width:Int(height) ,
                height:Int(width) ,
                quantity:Int(quantity) ,
                amount:Double(totalAmountLabel.text!)! ,
                paperPrice: pricePerSqft
            )
            if orderIndex >= 0 {
                ordersList[orderIndex] = orderObject
            }else{
                ordersList.append(orderObject)
            }
            performSegue(withIdentifier: "saveOrder", sender: self)
        }
    }

    @IBAction func searchClient(_ sender: UITextField) {
        valueFieldsIndex = 1
        goToFieldValues()
    }
    @IBAction func searchProduct(_ sender: UITextField) {
        valueFieldsIndex = 2
        goToFieldValues()
    }
    @IBAction func searchBgColor(_ sender: UITextField) {
        valueFieldsIndex = 3
        goToFieldValues()
    }
    @IBAction func searchFontColor(_ sender: UITextField) {
        valueFieldsIndex = 4
        goToFieldValues()
    }
    @IBAction func searchFontType(_ sender: UITextField) {
        valueFieldsIndex = 5
        goToFieldValues()
    }
    
    @IBAction func witdhChange(_ sender: UISlider) {
        width = Double(Int(sender.value))
        calculateTotal()
    }
    @IBAction func heightChange(_ sender: UISlider) {
        height = Double(Int(sender.value))
        calculateTotal()
    }
    @IBAction func quantityChange(_ sender: UISlider) {
        quantity = Int(sender.value)
        calculateTotal()
    }
    @IBAction func quantityTextChange(_ sender: UITextField) {
        if (!sender.text!.isEmpty && Int(sender.text!) != nil)  {
            quantity = Int(sender.text!)!
            if quantity < Int(quantitySlider.minimumValue) {
                quantity = Int(quantitySlider.minimumValue)
            }else if quantity > Int(quantitySlider.maximumValue){
                quantity = Int(quantitySlider.maximumValue)
            }
        }else{
            quantity = Int(quantitySlider.minimumValue)
        }
        
        calculateTotal()
    }
    
    
    func calculateTotal(){
        widthLabel.text = String(Int(width)) + " in"
        heightLabel.text = String(Int(height)) + " ft"
        quantitySlider.value = Float(quantity)
        quantityField.text = String(Int(quantity))
        totalAmount = (width/12.0) * (height) * Double(quantity)  * pricePerSqft
        totalAmountLabel.text = String(format: "%.2f", totalAmount)
    }

    func goToFieldValues(){
        valueFieldsArray = [
                orderIdLabel.text!,
                clientField.text!,
                paperTypeField.text! ,
                bgColorField.text! ,
                fontColorField.text! ,
                fontTypeField.text! ,
                String(width) ,
                String(height) ,
                String(quantity),
                String(pricePerSqft)
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
            width  = Double(valueFieldsArray[6])!
            heightSlider.value  = Float(Double(valueFieldsArray[7])!)
            height  = Double(valueFieldsArray[7])!
            quantitySlider.value = Float(Double(valueFieldsArray[8])!)
            quantity = Int(valueFieldsArray[8])!
            pricePerSqft = Double(valueFieldsArray[9])!
            
        }else{
            valueFieldsArray = []
            clientField.text = ""
            paperTypeField.text  = ""
            bgColorField.text  = ""
            fontColorField.text  = ""
            fontTypeField.text  = ""
            widthSlider.value  = Float(36)
            heightSlider.value  = Float(1)
            quantitySlider.value = Float(1)
            if orderIndex >= 0 {
                let currOrder = ordersList[orderIndex]
                orderIdLabel.text = String(format: "%06d", Int(currOrder.orderId)!)
                clientField.text = currOrder.orderClient
                paperTypeField.text  = currOrder.orderProduct
                bgColorField.text  = currOrder.orderBgColor
                fontColorField.text  = currOrder.orderFontColor
                fontTypeField.text  = currOrder.orderFontStyle
                widthSlider.value  = Float(currOrder.orderWidth)
                width  = Double(currOrder.orderWidth)
                heightSlider.value  = Float(currOrder.orderHeight)
                height  = Double(currOrder.orderHeight)
                quantitySlider.value = Float(currOrder.orderQuantity)
                quantityField.text = String(Int(currOrder.orderQuantity))
                quantity  = currOrder.orderQuantity
                pricePerSqft = currOrder.orderPaperPrice
            }else if ordersList.count > 0 {
                let lastOrder = ordersList[ordersList.count - 1].orderId
                orderIdLabel.text = String(format: "%06d", Int(lastOrder)! + 1)
            }else{
                orderIdLabel.text = String(format: "%06d", 1)
            }
            valueFieldsArray.append(orderIdLabel.text!)
            valueFieldsArray.append(clientField.text!)
            valueFieldsArray.append(paperTypeField.text!)
            valueFieldsArray.append(bgColorField.text!)
            valueFieldsArray.append(fontColorField.text!)
            valueFieldsArray.append(fontTypeField.text!)
            valueFieldsArray.append(String(width))
            valueFieldsArray.append(String(height))
            valueFieldsArray.append(String(quantity))
            valueFieldsArray.append(String(pricePerSqft))
        }
        priceLabel.text = String(format: "%.2f", pricePerSqft) + " x sqft"
        calculateTotal()
    }

    func inputFieldsValidated() -> Bool {
        self.clientField.text = clientField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.paperTypeField.text = paperTypeField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.bgColorField.text = bgColorField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.fontColorField.text = fontColorField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.fontTypeField.text = fontTypeField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        errorLbl.text=""
        if self.clientField.text?.count == 0 {
            errorLbl.text="Enter Client"
            return false
        }
        else if self.paperTypeField.text?.count == 0 {
            errorLbl.text="Enter Paper Type"
            return false
        }
        else if self.bgColorField.text?.count == 0 {
            errorLbl.text="Enter Background Color"
            return false
        }
        else if self.fontColorField.text?.count == 0 {
            errorLbl.text="Enter Font Color"
            return false
        }
        else if self.fontTypeField.text?.count == 0 {
            errorLbl.text="Enter Font Type"
            return false
        }
        else if self.quantitySlider.value == 0 {
            errorLbl.text="Enter Quantity value"
            return false
        }
        return true
    }
    
}
