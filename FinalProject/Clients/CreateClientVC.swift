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
    @IBOutlet weak var typeField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if clientIndex >= 0 {
            let currClient = clientsList[clientIndex]
            identificationField.text = currClient.clientIdentification
            fullnameField.text = currClient.clientFullName
            typeField.text = currClient.clientType
            companyField.text = currClient.clientCompanyCode
            phoneField.text = currClient.clientPhoneNumber
            emailField.text = currClient.clientEmail
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveClick(_ sender: Any) {
        let editClient = Client(identification: identificationField.text! , fullName: fullnameField.text! , type: typeField.text! , companyCode: companyField.text! , phoneNumber: phoneField.text! , email: emailField.text! )
        if clientIndex >= 0 {
            clientsList[clientIndex] = editClient
        }else{
            clientsList.append(editClient)
        }
        
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
