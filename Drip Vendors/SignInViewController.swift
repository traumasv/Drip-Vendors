//
//  SignInViewController.swift
//  Drip Vendors
//
//  Created by Joey Park on 12/5/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterPressed(_ sender: Any) {
        let password = self.passwordTextField.text
        let email = self.emailTextField.text
        
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if error == nil{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderView")
                self.show(vc!, sender: nil)
            }
            else {
                print("\(email) wrong email")
                return}
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
