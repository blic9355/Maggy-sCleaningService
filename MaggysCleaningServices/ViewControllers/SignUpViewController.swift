//
//  SignUpViewController.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/5/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // Mark: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        phoneTextField.delegate = self
    }
    
    // Mark: - Actions
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        guard let phoneNumber = phoneTextField.text else { return }
        
        if emailTextField.text != nil && passwordTextField.text != nil && phoneTextField.text != nil {
            AuthSevice.shared.registerUser(withEmail: emailText, andPassword: passwordText, andPhone: phoneNumber, userCreationComplete: { (success, registrationError) in
                if success {
                    AuthSevice.shared.loginUser(withEmail: emailText, andPassword: passwordText, loginComplete: { (success, nil) in
                        print("Successfully registered user")
                    })
                } else {
                    print(String(describing: registrationError?.localizedDescription))
                }
            })
        }
    }
    
    
}
