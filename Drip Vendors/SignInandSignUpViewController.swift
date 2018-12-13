//
//  SignInandSignUpViewController.swift
//  Drip Vendors
//
//  Created by Joey Park on 12/5/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class SignInandSignUpViewController: UIViewController {

    override func viewDidLoad() {
        self.title = "Back"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
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
