//
//  Users.swift
//  FinalProject
//
//  Created by user192101 on 3/15/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import Foundation

class Salesperson{
    var spFullname : String
    var spUsername : String
    var spPassword : String
    var spPhone : String
    var spEmail : String

    
    init(fullname: String, username: String, password: String, phone: String, email: String) {
        self.spFullname = fullname
        self.spUsername = username
        self.spPassword = password
        self.spPhone = phone
        self.spEmail = email
    }
    
}
