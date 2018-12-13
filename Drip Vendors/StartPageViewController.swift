//
//  StartPageViewController.swift
//  Drip Vendors
//
//  Created by Joey Park on 12/5/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import FirebaseAuth
class StartPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            //if logged in
            if(user != nil){
                let cc = self.storyboard?.instantiateViewController(withIdentifier: "LoggedIn")
                self.present(cc!, animated: false, completion: nil)
            }else{
                // Go to sign in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInandSignUpView")
                self.present(vc!, animated: false, completion: nil)
            }
            
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

