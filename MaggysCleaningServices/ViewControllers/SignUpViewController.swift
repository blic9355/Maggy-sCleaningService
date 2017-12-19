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
    let errorTitle = "Couldn't sign you in"
    let errorMessage = "Make sure your info is correct and try again"
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
        
        if emailTextField.text != nil && passwordTextField != nil {
            
            UserController.shared.createNewUser(email: emailText, password: passwordText, name: "", phone: "", address: "")
            
            self.performSegue(withIdentifier: "goToCalendar", sender: self)
            
        } else {
            presentErrorAlertWith(title: errorTitle, message: errorMessage)
        }
        
    }
    
    func presentErrorAlertWith(title: String, message: String) {
        
        let alertController = UIAlertController(title: self.errorTitle, message: self.errorMessage, preferredStyle: .alert)
        
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
    
}
