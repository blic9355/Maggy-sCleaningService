//
//  SignUpViewController.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/5/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // Mark: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // Mark: - Actions
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { (user, error) in
            
            if error != nil {
                print(error)
            } else {
                //success
                print("Registration successful")
                
                self.performSegue(withIdentifier: "goToCalendar", sender: self)
            }
        }
        
    }
    
    
}
