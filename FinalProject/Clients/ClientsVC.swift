//
//  ClientsVC.swift
//  FinalProject
//
//  Created by user192101 on 3/16/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class ClientsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        clientsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let client = clientsList[indexPath.row]
        let cell = clientsTable.dequeueReusableCell(withIdentifier: "clientsRow") as! ClientCell
        cell.setClientCell(client: client)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        clientIndex = indexPath.row
        performSegue(withIdentifier: "editClient", sender: self)
    }
    
    
    var ordersList = [Order]()
    var clientsList = [Client]()
    var userList = [Salesperson]()
    var userLogged : Salesperson? = nil
    var producstList = [Product]()
    var clientIndex = -1
    @IBOutlet weak var clientsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        clientsTable.delegate = self
        clientsTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        switch segue.identifier {
        case "clientsToHome":
            let homeVC = segue.destination as! HomeVC
            homeVC.userList = userList
            homeVC.ordersList = ordersList
            homeVC.clientsList = clientsList
            homeVC.userLogged = userLogged
            homeVC.producstList = producstList
            
        case "addClient", "editClient":
            let createVC = segue.destination as! CreateClientVC
            createVC.userList = userList
            createVC.ordersList = ordersList
            createVC.clientsList = clientsList
            createVC.userLogged = userLogged
            createVC.producstList = producstList
            createVC.clientIndex = clientIndex
        default:
            break
        }
    }

    

}
