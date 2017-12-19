//
//  UserVC.swift
//  MaggysCleaningServices
//
//  Created by Brian Licea on 12/18/17.
//  Copyright © 2017 Brian Licea. All rights reserved.
//

import UIKit
import Firebase

class UserVC: UIViewController {
//    var refDB: DataService.
    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentUser = UserController.shared.currentUser else { return }
        emailLabel.text = currentUser.email
        nameLabel.text = currentUser.name
        phoneLabel.text = currentUser.phone
        addressLabel.text = currentUser.address
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Actions
    
    @IBAction func editInfoBtn(_ sender: Any) {
        
    }
    
    @IBAction func signOutBtnTap(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                guard let FirstVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstVC") as? FirstViewController else { return }
                self.present(FirstVC, animated: true, completion: nil)
                print("User Logged out")
            } catch {
            print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditInfo" {
            guard let destinationVC = segue.destination as? UserEditViewController else { return }
            
        }
    }
}
