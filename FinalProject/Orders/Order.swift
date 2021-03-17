//
//  Order.swift
//  FinalProject
//
//  Created by user192101 on 3/16/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import Foundation


class Order{
    var orderId: String
    var orderClient: String
    var orderProduct: String
    var orderBgColor: String
    var orderFontColor: String
    var orderFontStyle: String
    var orderWidth: Double
    var orderHeight: Double
    var orderQuantity: Int
    var orderAmount: Double

init( id: String, client: String, product: String, bgColor: String, fontColor: String, fontStyle: String, width: Double, height: Double, quantity: Int, amount: Double ) {
        self.orderId = id
        self.orderClient = client
        self.orderProduct = product
        self.orderBgColor = bgColor
        self.orderFontColor = fontColor
        self.orderFontStyle = fontStyle
        self.orderWidth = width
        self.orderHeight = height
        self.orderQuantity = quantity
        self.orderAmount = amount
    
}

}