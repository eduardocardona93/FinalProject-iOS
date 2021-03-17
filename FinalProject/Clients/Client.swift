//
//  Client.swift
//  FinalProject
//
//  Created by user192101 on 3/15/21.
//  Copyright © 2021 user192101. All rights reserved.
//

import Foundation

class Client {
    var clientFullName: String
    var clientIdentification: String
    var clientType: String
    var clientCompanyCode: String
    var clientPhoneNumber: String
    var clientEmail: String

    
    init( identification: String , fullName: String , type: String , companyCode: String , phoneNumber: String , email: String ) {
        self.clientIdentification = identification
        self.clientFullName = fullName
        self.clientType = type
        self.clientCompanyCode = companyCode
        self.clientPhoneNumber = phoneNumber
        self.clientEmail = email
    }
    
}
