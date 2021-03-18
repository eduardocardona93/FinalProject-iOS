//
//  HomeVC.swift
//  FinalProject
//
//  Created by user192101 on 3/17/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var userList = [Salesperson]()
    var ordersList = [Order]()
    var clientsList = [Client]()
    var userLogged : Salesperson?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        switch segue.identifier {
        case "logout":
            let logVC = segue.destination as! LoginVC
            logVC.ordersList = ordersList
            logVC.clientsList = clientsList
        case "toProducts":
            let prodVC = segue.destination as! ProductVC
            prodVC.userList = userList
            prodVC.ordersList = ordersList
            prodVC.clientsList = clientsList
            prodVC.userLogged = userLogged
        case "toClients":
            let cliVC = segue.destination as! ClientsVC
            cliVC.userList = userList
            cliVC.ordersList = ordersList
            cliVC.clientsList = clientsList
            cliVC.userLogged = userLogged
        case "toOrders":
            let ordVC = segue.destination as! OrdersVC
            ordVC.userList = userList
            ordVC.ordersList = ordersList
            ordVC.clientsList = clientsList
            ordVC.userLogged = userLogged
        default:
            break
        }
    }
    

}
