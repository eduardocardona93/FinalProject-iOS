//
//  Product.swift
//  FinalProject
//
//  Created by user192101 on 3/16/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import Foundation

class Product {
    var prodId: Int
    var prodName: String
    var prodDescription: String
    var prodPrice: String
    var prodImageSet: [String]
    
    init(id: Int, name: String, description: String, price: String, imageSet: [String]) {
        self.prodId = id
        self.prodName = name
        self.prodDescription = description
        self.prodPrice = price
        self.prodImageSet = imageSet
    }
    
}   
