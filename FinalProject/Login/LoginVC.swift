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
        fillData()
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
        }else if segue.identifier == "userLogged" {
            let homeVC = segue.destination as! HomeVC
            
            homeVC.userList = userList
            homeVC.ordersList = ordersList
            homeVC.clientsList = clientsList
            homeVC.userLogged = userLogged
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
    func fillData(){
        if userList.count == 0{
            userList.append(Salesperson(fullname: "Eduardo Cardona", username: "eduardoacm93", password: "123456", phone: "5555555",email: "eduardoacm93@company.com"))
            userList.append(Salesperson(fullname: "Ranjana", username: "ranjana", password: "778899", phone: "3232323", email: "ranjana@company.com"))
            userList.append(Salesperson(fullname: "Dina Johnson", username: "dj", password: "000111", phone: "4545454",  email: "dj@company.com"))
        }

    }

}
