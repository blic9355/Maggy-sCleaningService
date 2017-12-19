//
//  LoginViewController.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/5/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    // Mark: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    let alertErrorTitle = "Couldn't Sign in"
    let alertErrorMessage = "We couldn't sign you in. Check that all your login info is correct or sign up"
    
    let notificationCenter = NotificationCenter.default
    
    // Mark: - Actions
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextfield.text else { return }
//
//        if emailTextField != nil && passwordTextfield != nil {
//            AuthSevice.shared.loginUser(withEmail: emailText, andPassword: passwordText, loginComplete: { (success, loginError) in
//                if success {
//                    self.performSegue(withIdentifier: "goToCalendar", sender: self)
//                } else {
//                    self.presentErrorAlertWith(title: self.alertErrorTitle, message: self.alertErrorMessage)
//                }
//            })
//        }

        UserController.shared.logIn(email: emailText, password: passwordText)
        
    }
    
  
    
    func presentErrorAlertWith(title: String, message: String) {
        
        let alertController = UIAlertController(title: self.alertErrorTitle, message: self.alertErrorMessage, preferredStyle: .alert)
        
        let subview = alertController.view.subviews.first! as UIView
        let alertContentView = subview.subviews.first! as UIView
        alertContentView.layer.cornerRadius = 5.0
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let signUpAction =  UIAlertAction(title: "Sign up", style: .default, handler: { (signUpSegue) in
            let SignUpSegue = self.storyboard?.instantiateViewController(withIdentifier: "signUpVC")
            self.present(SignUpSegue!, animated: true, completion: nil)
        })
        
        alertController.addAction(okAction)
        alertController.addAction(signUpAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self as? UITextFieldDelegate
        passwordTextfield.delegate = self as? UITextFieldDelegate
        
        notificationCenter.addObserver(self, selector: #selector(segueToTab), name: UserController.shared.currentUserWasSetNotification, object: nil)
        
        
        
    }
    
    @objc func segueToTab() {
        performSegue(withIdentifier: "goToCalendar", sender: self)
    }
    
}


