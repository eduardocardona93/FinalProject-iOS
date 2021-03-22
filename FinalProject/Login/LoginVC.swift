//
//  LoginVC.swift
//  FinalProject
//
//  Created by user192101 on 3/15/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

//Test Repo commit


class LoginVC: UIViewController {
    var ordersList = [Order]()
    var clientsList = [Client]()
    var userList = [Salesperson]()
    var userLogged : Salesperson? = nil
    var producstList = [Product]()
    @IBOutlet weak var loginNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorLoginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
        loginNameField.addDoneButtonOnKeyboard()
        passwordField.addDoneButtonOnKeyboard()
        loginButton.layer.cornerRadius = 10
        errorLoginLabel.text = ""
        fillUsers()
        fillClients()
        fillProducts()
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "register" {
            let regVC = segue.destination as! RegisterVC
            regVC.userList = userList
            regVC.ordersList = ordersList
            regVC.clientsList = clientsList
            regVC.producstList = producstList
            
        }else if segue.identifier == "userLogged" {
            let homeVC = segue.destination as! HomeVC
            
            homeVC.userList = userList
            homeVC.ordersList = ordersList
            homeVC.clientsList = clientsList
            homeVC.userLogged = userLogged
            homeVC.producstList = producstList
        }

    }
    

    @IBAction func loginClick(_ sender: Any) {
        if loginNameField.text!.count == 0 {
            errorLoginLabel.text = "Username Field Empty"
        }else if passwordField.text!.count == 0 {
            errorLoginLabel.text = "Password Field Empty"
        }else{
            for user in userList{
                if (user.spUsername == loginNameField.text || user.spEmail == loginNameField.text ) && passwordField.text == user.spPassword{
                    userLogged = user
                }
            }
            
            if userLogged != nil{
                errorLoginLabel.text = ""
                performSegue(withIdentifier: "userLogged", sender: self)
            }else{
                errorLoginLabel.text = "User or Password Invalid"
            }
        }

    }
    func fillUsers(){
        if userList.count == 0{
            userList.append(Salesperson(fullname: "Eduardo Cardona", username: "eduardoacm93", password: "123456", phone: "5555555",email: "eduardoacm93@company.com"))
            userList.append(Salesperson(fullname: "Ranjana", username: "ranjana", password: "778899", phone: "3232323", email: "ranjana@company.com"))
            userList.append(Salesperson(fullname: "Dina Johnson", username: "dj", password: "000111", phone: "4545454",  email: "dj@company.com"))
        }
    }

        
    func fillClients(){
        if clientsList.count == 0 {
            clientsList.append(Client( identification: "111111" , fullName: "Rasagjna Ghandi" , companyCode: "21554" , phoneNumber: "913133337755" , email: "example1@company1.com" ))
            clientsList.append(Client( identification: "222222" , fullName: "Lino Hernandez" , companyCode: "21553" , phoneNumber: "915133436754" , email: "example2@company2.com" ))
        }
    }
        
	func fillProducts(){
        if producstList.count == 0 {
            producstList.append(Product(id: 100, name: "Inkjet printer paper", price: 10.0, description: "this type of papper is designed for specific use with"))
            producstList.append(Product(id: 200, name: "Matte", price: 5.0, description: "particularly for those seeking a softer, smoother appearance that minimizes glare."))
            producstList.append(Product(id: 300, name: "Bright White", price: 5.0, description: "it is Multipurpose Office Paper is very suitable to be used in fast speeds and hassle-free printers and copiers"))
            producstList.append(Product(id: 400, name: "Glossy", price: 15.0, description: "It is a high quality resin coated photographic paper with a glossy finish."))
            producstList.append(Product(id: 500, name: "Paper Banner Printing", price: 30.0, description: "Paper prints are meant for indoor use only"))
            producstList.append(Product(id: 1100, name: "No Curl Vinyl Banners", price: 25.0, description: "non-curl banners have a non-curling edge, allowing them to lie flat without using hemming tapes"))
            producstList.append(Product(id: 1200, name: "Mesh Banners", price: 36.0, description: "They have little holes to allow some wind to go through the material which is used in windy environments"))
            producstList.append(Product(id: 1300, name: "Canvas Banners", price: 40.0, description: "A Canvas Banners are pritned using a digital print"))
            producstList.append(Product(id: 1400, name: "Polyester Fabric Banners", price: 35.0, description: "these banners are perfect for both indoor and outdoor settings, because it has features like non twist, waterproof and lightweight."))
            producstList.append(Product(id: 1500, name: "Vinyl Banner Printing", price: 25.0, description: "digitally printed on large format inkjet printers which are capable of printing a full color outdoor billboard on a single piece of material."))
        }

    }

}
