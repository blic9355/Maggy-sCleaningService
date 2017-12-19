//
//  Users.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/19/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import Foundation

class User {
    let uid: String
    let name: String
    let email: String
    let phone: String
    let address: String
    
    init(uid: String, name: String, email: String, phone: String, address: String) {
        self.uid = uid
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
        return
    }
    
    init?(dictionary: [String: Any], uid: String) {
        
        guard let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String,
            let phone = dictionary["phone"] as? String,
            let address = dictionary["address"] as? String else { return nil }
        
        self.uid = uid
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
    }
    
    var dictionaryRep: [String : [String: Any]] {
        return [uid : ["name": name,
                       "email": email,
                       "phone": phone,
                       "address": address]]
    }
    
}
