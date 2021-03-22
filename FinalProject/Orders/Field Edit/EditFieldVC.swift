//
//  EditFieldVC.swift
//  FinalProject
//
//  Created by user192101 on 3/19/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import UIKit

class EditFieldVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        optionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = optionsArray[indexPath.row]
        let cell = valuesTable.dequeueReusableCell(withIdentifier: "fieldValueRow") as! FieldValueCell
        cell.setLabel(option:option)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        valueFieldsArray[valueFieldsIndex] = optionsArray[indexPath.row]
        if(valueFieldsIndex == 2){
            valueFieldsArray[9] = String(producstList[indexPath.row].prodPrice)
        }
        performSegue(withIdentifier: "selectedField", sender: self)
    }
    
    var ordersList = [Order]()
    var clientsList = [Client]()
    var userList = [Salesperson]()
    var userLogged : Salesperson? = nil
    var producstList = [Product]()
    var orderIndex = -1
    var valueFieldsArray = [String]()
    var valueFieldsIndex = 0

    var optionsArray = [String]()
    
    @IBOutlet weak var valuesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataArray()
        valuesTable.dataSource = self
        valuesTable.delegate = self
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let orderVC = segue.destination as! CreateOrderVC
        orderVC.userList = userList
        orderVC.ordersList = ordersList
        orderVC.clientsList = clientsList
        orderVC.userLogged = userLogged
        orderVC.orderIndex = orderIndex
        orderVC.producstList = producstList
        orderVC.valueFieldsIndex = valueFieldsIndex
        orderVC.valueFieldsArray = valueFieldsArray
    }

    func initDataArray(){
        switch valueFieldsIndex {
            case 1:
                for client in clientsList{
                    optionsArray.append(client.clientIdentification + " - " + client.clientFullName)
                }
            case 2:
                optionsArray.append("100 - Inkjet printer paper")
                optionsArray.append("200 - Matte")
                optionsArray.append("300 - Bright White")
                optionsArray.append("400 - Glossy")
                optionsArray.append("500 - Card Stock")
                optionsArray.append("600 - Resume")
                optionsArray.append("700 - A size (A3,A4,A2,A5,etc)")
                optionsArray.append("800 - C size (C3,etc)")
                optionsArray.append("900 - Paper Banner Printing")
                optionsArray.append("1500 - Vinyl Banner Printing")
                optionsArray.append("1100 - No Curl Vinyl Banners")
                optionsArray.append("1200 - Mesh Banners")
                optionsArray.append("1300 - Canvas Banners")
                optionsArray.append("1400 - Polyester Fabric Banners")
            case 3,4:
                optionsArray = [
                    "Red",	
                    "White",
                    "Cyan",
                    "Silver",
                    "Blue",
                    "Gray",
                    "DarkBlue",
                    "Black",
                    "LightBlue",
                    "Orange",
                    "Purple",
                    "Brown",
                    "Yellow",
                    "Maroon",
                    "Lime",
                    "Green",	
                    "Magenta",	
                    "Olive"
                ]
            case 5:
                optionsArray = [
                    "Helvetica",
                    "Baskerville",
                    "Times",
                    "Akzidenz Grotesk",
                    "Gotham",
                    "Bodoni",
                    "Didot",
                    "Futura",
                    "Gill Sans",
                    "Frutiger",
                    "Bembo",
                    "Rockwell",
                    "Franklin Gothic",
                    "Sabon",
                    "Georgia",
                    "Garamond",
                    "News Gothic",
                    "Myriad",
                    "Mrs Eaves",
                    "Minion"
                ]
            default:
                optionsArray = []
            
        }
    }
    

}
