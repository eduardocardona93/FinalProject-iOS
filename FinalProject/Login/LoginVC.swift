//
//  LoginVC.swift
//  FinalProject
//
//  Created by user192101 on 3/15/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    var userList = [Salesperson]()
    @IBOutlet weak var loginNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
        fillData()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginClick(_ sender: Any) {
        for user in userList{
            
        }
    }
    @IBAction func registerClick(_ sender: Any) {
        
    }
    func fillData(){
        userList.append(Salesperson(fullname: "Eduardo Cardona", username: "eduardoacm93", password: "123456", phone: "5555555",email: "eduardoacm93@company.com"))
        userList.append(Salesperson(fullname: "Ranjana", username: "ranjana", password: "778899", phone: "3232323", email: "ranjana@company.com"))
        userList.append(Salesperson(fullname: "Dina Johnson", username: "dj", password: "000111", phone: "4545454",  email: "dj@company.com"))
    }

}
