//
//  AuthService.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/4/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

//import Foundation
//import Firebase
//
//class AuthSevice {
//    static let shared = AuthSevice()
//    
//    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
//        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
//            guard let user = user else { userCreationComplete(false, error); return }
//            
//            let userData = ["provider": user.providerID, "email": user.email]
//            DataService.shared.createDBUser(uid: user.uid, userData: userData)
//            userCreationComplete(true, nil)
//        }
//    }
//    
//        func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
//            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
//                if error != nil {
//                    loginComplete(false, error)
//                    return
//                }
//                loginComplete(true, nil)
//            }
//        }
//}
//
