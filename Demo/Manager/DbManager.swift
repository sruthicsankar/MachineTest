//
//  DbManager.swift
//  Demo
//
//  Created by sruthi c sankar on 11/10/21.
//

import UIKit
import RealmSwift


class DbManager: NSObject {
    
    var localRealm: Realm?
    
    
    static let shared = DbManager()

    private override init() {
        _ = try! Realm.deleteFiles(for: Realm.Configuration.defaultConfiguration)
        localRealm = try! Realm()

    }
    
    func saveUser(firstName: String, lastName: String, email: String, password: String, phoneNumber: String, gender: String) {
                
        let user = User.init(firstName: firstName, lastName: lastName, email: email, password: password, phoneNumber: phoneNumber, gender: gender)
        
    
        
        try! localRealm!.write {
            localRealm!.add(user)
        }
    }
    
    func getAllUser() -> [User] {
        var list: [User] = []
        let task = localRealm!.objects(User.self)
        
        task.forEach { user in
            list.append(user)
        }
        return list
    }

}
