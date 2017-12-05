//
//  DataService.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/4/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import Foundation
import Firebase

let dbBase = Database.database().reference()

class DataService {
    static let shared = DataService()
    
    private var refBASE = dbBase
    private var refUSERS = dbBase.child("users")
    
    var refBase: DatabaseReference {
        return refBASE
    }
    
    var refUsers: DatabaseReference {
        return refUSERS
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        refUSERS.child(uid).updateChildValues(userData)
    }
}
