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

        fillProducts()
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
        }else if segue.identifier == "productsToHome"{
            let homeVC = segue.destination as! HomeVC
            homeVC.userList = userList
            homeVC.ordersList = ordersList
            homeVC.clientsList = clientsList
            homeVC.userLogged = userLogged
        }
        
    }
    
    
	func fillProducts(){
        producstList.append(Product(id: 100, name: "Inkjet printer paper", price: 10.0, description: "this type of papper is designed for specific use with"))
        producstList.append(Product(id: 200, name: "Matte", price: 5.0, description: "particularly for those seeking a softer, smoother appearance that minimizes glare."))
        producstList.append(Product(id: 300, name: "Bright White", price: 5.0, description: "it is Multipurpose Office Paper is very suitable to be used in fast speeds and hassle-free printers and copiers"))
        producstList.append(Product(id: 400, name: "Glossy", price: 15.0, description: "It is a high quality resin coated photographic paper with a glossy finish."))
        producstList.append(Product(id: 500, name: "Card Stock", price: 29.0, description: "it is thicker and more durable than normal writing and printing paper, but thinner and more flexible than other forms of paperboard."))
        producstList.append(Product(id: 600, name: "Resume", price: 25.0, description: "it's heavier stock than standard printer paper, and features a more refined color"))
        producstList.append(Product(id: 700, name: "A size (A3,A4,A2,A5, etc etc)", price: 15.0, description: "there are many types of A size papers which is used for printing"))
        producstList.append(Product(id: 800, name: "C size (C3,etc,etc)", price: 15.0, description: "there are many types of A size papers which is used for printing"))
        producstList.append(Product(id: 900, name: "Paper Banner Printing", price: 30.0, description: "Paper prints are meant for indoor use only"))
        producstList.append(Product(id: 1500, name: "Vinyl Banner Printing", price: 25.0, description: "digitally printed on large format inkjet printers which are capable of printing a full color outdoor billboard on a single piece of material."))
        producstList.append(Product(id: 1100, name: "No Curl Vinyl Banners", price: 25.0, description: "non-curl banners have a non-curling edge, allowing them to lie flat without using hemming tapes"))
        producstList.append(Product(id: 1200, name: "Mesh Banners", price: 36.0, description: "They have little holes to allow some wind to go through the material which is used in windy environments"))
        producstList.append(Product(id: 1300, name: "Canvas Banners", price: 40.0, description: "A Canvas Banners are pritned using a digital print"))
        producstList.append(Product(id: 1400, name: "Polyester Fabric Banners", price: 35.0, description: "these banners are perfect for both indoor and outdoor settings, because it has features like non twist, waterproof and lightweight."))
    }

}
