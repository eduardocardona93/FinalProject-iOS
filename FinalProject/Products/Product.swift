//
//  Product.swift
//  FinalProject
//
//  Created by user192101 on 3/17/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import Foundation

class Product {
    var prodId: Int
    var prodName: String
    var prodDescription: String
    var prodPrice: Double
    
    init(id: Int, name: String, price: Double, description: String) {
        self.prodId = id
        self.prodName = name
        self.prodDescription = description
        self.prodPrice = price
    }
    
}   
