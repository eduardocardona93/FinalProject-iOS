//
//  RegisterVC.swift
//  FinalProject
//
//  Created by user192101 on 3/15/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var retypePasswordTextField: UITextField!
    @IBOutlet weak var errorMessageTextField: UILabel!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    var userList = [Salesperson]()	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameTextField.addDoneButtonOnKeyboard()
        userNameTextField.addDoneButtonOnKeyboard()
        phoneNumberTextField.addDoneButtonOnKeyboard()
        emailAddressTextField.addDoneButtonOnKeyboard()
        passwordTextField.addDoneButtonOnKeyboard()
        retypePasswordTextField.addDoneButtonOnKeyboard()
        
        passwordTextField.isSecureTextEntry = true
        retypePasswordTextField.isSecureTextEntry = true
        errorMessageTextField.text = ""
        saveButton.layer.cornerRadius = 10
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        let logVC = segue.destination as! LoginVC
        logVC.userList = userList
     }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "returnRegister" || ( identifier == "userRegistered" && inputFieldsValidated()){
            return true
        }else{
            return false
        }
    }
    
    
    // check if User details are valid
    func inputFieldsValidated() -> Bool {
        
        self.fullNameTextField.text = fullNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.userNameTextField.text = userNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.phoneNumberTextField.text = phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.emailAddressTextField.text = emailAddressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.passwordTextField.text = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.retypePasswordTextField.text = retypePasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if self.fullNameTextField.text?.count == 0 {
            errorMessageTextField.text="Enter Full Name"
            return false
        }
        else if self.userNameTextField.text?.count == 0 {
            errorMessageTextField.text="Enter User Name"
            return false
        }
        else if self.phoneNumberTextField.text?.count == 0 {
            errorMessageTextField.text = "Enter Phone Number"
            return false
        }
        else if self.emailAddressTextField.text?.count == 0 {
            errorMessageTextField.text="Enter Email"
            return false
        }
        else if self.passwordTextField.text?.count == 0 {
            errorMessageTextField.text="Enter Password"
            return false
        }
        else if self.retypePasswordTextField.text?.count == 0 {
            errorMessageTextField.text="Retype Password"
            return false
        }
        else if  self.passwordTextField.text != self.retypePasswordTextField.text!{
            errorMessageTextField.text="Password Mismatched"
            return false
        }
        userList.append(Salesperson(fullname: fullNameTextField.text!, username: userNameTextField.text!, password: phoneNumberTextField.text!, phone: emailAddressTextField.text!,email: passwordTextField.text! ))
        return true
    }
    
}
