//
//  UserController.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/19/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import Foundation
import Firebase

class UserController {
    
    static let shared = UserController()
    
    let currentUserWasSetNotification = Notification.Name("currentUserWasSetNotification")
    
    var currentUser: User? {
        didSet {
            NotificationCenter.default.post(name: currentUserWasSetNotification, object: nil)
        }
    }
    
    
    
    var ref: DatabaseReference! = Database.database().reference()
    
    var firebaseAuth = Auth.auth()
    
    
    func createNewUser(email: String, password: String, name: String, phone: String, address: String) {
        
        firebaseAuth.createUser(withEmail: email, password: password) { (firUser, error) in
            if let error = error {
                NSLog("Error creating user. \(error): \(error.localizedDescription)")
                return
            }
            
            if let firUser = firUser {
                
                let newUser = User(uid: firUser.uid, name: name, email: email, phone: phone, address: address)
                
                self.ref.child("user").setValue(newUser.dictionaryRep)
                
            }
        }
    }
    
    func logIn(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (firUser, error) in
            if let error = error {
                NSLog("Error signing in. \(error): \(error.localizedDescription)")
                return
            }
            
            guard let firUser = firUser else { return }
            
            Database.database().reference().child("user/\(firUser.uid)").observeSingleEvent(of: .value, with: { (snapshot) in
                guard let userDictionary = snapshot.value as? [String: Any] else { NSLog("There is no data for the firUser id") ; return }
                
                let user = User(dictionary: userDictionary, uid: firUser.uid)
                
                self.currentUser = user
                
            }, withCancel: { (error) in
                print(error)
            })
            
        }
        
        
    }
    
    
}










