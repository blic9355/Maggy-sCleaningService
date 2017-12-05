//
//  LoginViewController.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/5/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    let alertErrorTitle = "Error Signing in"
    let alertErrorMessage = "We couldn't sign you in. Check that all your login info is correct or sign up"
    
    func presentErrorAlertWith(title: String, message: String) {
        
        let alertController = UIAlertController(title: alertErrorTitle, message: alertErrorMessage, preferredStyle: .alert)
        
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
    @IBAction func signInButtonTapped(_ sender: Any) {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextfield.text else { return }
        if emailTextField.text != nil && passwordTextfield.text != nil {
            AuthSevice.shared.loginUser(withEmail: emailText, andPassword: passwordText, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else if success == false {
                    self.presentErrorAlertWith(title: self.alertErrorTitle, message: self.alertErrorMessage)
                    print(String(describing: loginError?.localizedDescription))
                }
                
            })
        }
        
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextfield.delegate = self
        
    }
    
}

extension LoginViewController: UITextFieldDelegate { }
