//
//  User.swift
//  Demo
//
//  Created by sruthi c sankar on 11/10/21.
//

import UIKit
import RealmSwift

class User: Object {

    @Persisted var firstName: String = ""
    @Persisted var lastName: String?
    @Persisted var email: String = ""
    @Persisted var password: String = ""
    @Persisted var phoneNumber: String = ""
    @Persisted var gender: String = ""

    
    
    convenience init(firstName: String, lastName: String, email: String, password: String, phoneNumber: String, gender: String) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.gender = gender
    }
    
}
