//
//  OrdersVC.swift
//  FinalProject
//
//  Created by user192101 on 3/16/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class OrdersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ordersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let order = ordersList[indexPath.row]
        let cell = ordersTable.dequeueReusableCell(withIdentifier: "ordersRow") as! OrderCell
        cell.setOrder(order: order)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        orderIndex = indexPath.row
        performSegue(withIdentifier: "editOrder", sender: self)
    }
    
    var ordersList = [Order]()
    var clientsList = [Client]()
    var userList = [Salesperson]()
    var userLogged : Salesperson? = nil
    var orderIndex = -1
    @IBOutlet weak var ordersTable: UITableView!
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
        case "ordersToHome":
            let homeVC = segue.destination as! HomeVC
            homeVC.userList = userList
            homeVC.ordersList = ordersList
            homeVC.clientsList = clientsList
            homeVC.userLogged = userLogged
            
        case "addOrder", "editOrder":
            let createVC = segue.destination as! CreateOrderVC
            createVC.userList = userList
            createVC.ordersList = ordersList
            createVC.clientsList = clientsList
            createVC.userLogged = userLogged
            createVC.orderIndex = orderIndex
        default:
            break
        }
    }
    

}
