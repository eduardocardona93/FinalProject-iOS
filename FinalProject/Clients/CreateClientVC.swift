//
//  CreateClientVC.swift
//  FinalProject
//
//  Created by user192101 on 3/15/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class CreateClientVC: UIViewController {
    var ordersList = [Order]()
    var clientsList = [Client]()
    var userList = [Salesperson]()
    var userLogged : Salesperson? = nil
    
    var clientIndex = -1
    
    @IBOutlet weak var identificationField: UITextField!
    @IBOutlet weak var fullnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
        if clientIndex >= 0 {
            let currClient = clientsList[clientIndex]
            identificationField.text = currClient.clientIdentification
            fullnameField.text = currClient.clientFullName
            companyField.text = currClient.clientCompanyCode
            phoneField.text = currClient.clientPhoneNumber
            emailField.text = currClient.clientEmail
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveClick(_ sender: Any) {
        if inputFieldsValidated(){
            let editClient = Client(identification: identificationField.text! , fullName: fullnameField.text! ,  companyCode: companyField.text! , phoneNumber: phoneField.text! , email: emailField.text! )
            if clientIndex >= 0 {
                clientsList[clientIndex] = editClient
            }else{
                clientsList.append(editClient)
            }
           
            performSegue(withIdentifier: "saveClient", sender: self)
        }

        
        
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let clientVC = segue.destination as! ClientsVC
        clientVC.userList = userList
        clientVC.ordersList = ordersList
        clientVC.clientsList = clientsList
        clientVC.userLogged = userLogged
    }
    

        // check if User details are valid
    func inputFieldsValidated() -> Bool {
        self.identificationField.text = identificationField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.fullnameField.text = fullnameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.phoneField.text = phoneField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.emailField.text = emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.companyField.text = companyField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if self.identificationField.text?.count == 0 {
            errorLabel.text="Enter Identification"
            return false
        }
        else if self.fullnameField.text?.count == 0 {
            errorLabel.text="Enter Full Name"
            return false
        }
        else if self.phoneField.text?.count == 0 {
            errorLabel.text = "Enter Phone Number"
            return false
        }
        else if self.emailField.text?.count == 0 {
            errorLabel.text="Enter Email"
            return false
        }
        else if self.companyField.text?.count == 0 {
            errorLabel.text="Enter Company Code"
            return false
        }
        else if self.emailField.text?.count == 0 {
            errorLabel.text="Enter Email"
            return false
        }

        return true
    }

}
