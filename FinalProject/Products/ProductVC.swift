//
//  ProductVC.swift
//  FinalProject
//
//  Created by user192101 on 3/17/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class ProductVC: UIViewController , UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        producstList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prod = producstList[indexPath.row]
        let cell = productsTable.dequeueReusableCell(withIdentifier: "productsRow") as! ProductCell
        cell.setProductCell(product: prod)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = producstList[indexPath.row]
        performSegue(withIdentifier: "detailProduct", sender: self)
    }
    var ordersList = [Order]()
    var clientsList = [Client]()
    var userList = [Salesperson]()
    var producstList = [Product]()
    var userLogged : Salesperson? = nil
    var selectedProduct : Product? = nil
    

    @IBOutlet weak var productsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productsTable.delegate = self
        productsTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailProduct"{
            let detailProdVC = segue.destination as! ProductDetailVC
            detailProdVC.userList = userList
            detailProdVC.ordersList = ordersList
            detailProdVC.clientsList = clientsList
            detailProdVC.userLogged = userLogged
            detailProdVC.selectedProduct = selectedProduct!
            detailProdVC.producstList = producstList
        }else if segue.identifier == "productsToHome"{
            let homeVC = segue.destination as! HomeVC
            homeVC.userList = userList
            homeVC.ordersList = ordersList
            homeVC.clientsList = clientsList
            homeVC.userLogged = userLogged
            homeVC.producstList = producstList
        }
        
    }
    

}
