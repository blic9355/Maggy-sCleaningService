//
//  AdminAuthSevice.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/5/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

//import Foundation
//import Firebase

//class AdminAuthSevice {
//    static let instance = AuthSevice()
//    
//    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
//        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
//            guard let user = user else { userCreationComplete(false, error); return }
//            
//            let userData = ["provider": user.providerID, "emial": user.email]
//            DataService.shared.createDBUser(uid: user.uid, userData: userData)
//            userCreationComplete(true, nil)
//        }
//        
//        func loginUser(withEmail email: String, andPassword: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
//            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
//                if error != nil {
//                    loginComplete(false, error)
//                    return
//                }
//                loginComplete(true, nil)
//            }
//        }
//    }
//}

