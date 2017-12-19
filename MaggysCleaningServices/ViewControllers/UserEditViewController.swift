//
//  UserEditViewController.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/19/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import UIKit
import Firebase

class UserEditViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    let name = ""
    let email = ""
    let phone = ""
    let address = ""
    
    
    // Mark: - Actions
    @IBAction func saveBtn(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
