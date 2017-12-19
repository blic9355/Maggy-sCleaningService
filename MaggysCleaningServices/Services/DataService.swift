//
//  DataService.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/4/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//
//
//import Foundation
//import Firebase
//
//
//let dbBase = Database.database().reference()
//class DataService {
//    static let shared = DataService()
//    
//    private var refBASE = dbBase
//    private var refUSERS = dbBase.child("users")
//    
//    
//    
//    var refBase: DatabaseReference {
//        return refBASE
//    }
//    
//    var refUsers: DatabaseReference {
//        return refUSERS
//    }
//    
//    func createDBUser(uid: String,userData: Dictionary<String, Any>) {
//        refUSERS.child(uid).updateChildValues(userData)
//        
//    }
//    
//    func UpdateDBUser(name: String?, email: String?, address: String?, phone: String?, userData: Dictionary<String, Any>) {
//        guard let email = email else { return }
//        guard let name = name else { return }
//        guard let address = address else { return }
//        guard let phone = phone else { return }
//        
//        refUSERS.child(email).updateChildValues(userData)
//        refUSERS.child(name).updateChildValues(userData)
//        refUSERS.child(address).updateChildValues(userData)
//        refUSERS.child(phone).updateChildValues(userData)
//        
//    }
//    
//    func getUsernameFor(uid: String, completion: @escaping (_ username: String) -> ()) {
//        refUsers.observeSingleEvent(of: .value) { (userSnapshot) in
//            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
//            for user in userSnapshot {
//                if user.key == uid {
//                    completion(user.childSnapshot(forPath: "email").value as! String)
//                }
//            }
//        }
//    }
//    
//}

