//
//  ProcessingViewController.swift
//  Drip Vendors
//
//  Created by Joey Park on 12/6/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProcessingViewController: UIViewController {
    private var db :Firestore?
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var additiveLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var TIME = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vendor = Vendor.getInstance()
        let order = vendor.currentOrder
        let timeLeft = (order as! Order).timeLeft
        let name = (order as! Order).name ?? "nobody"
        let size = (order as! Order).size ?? "no"
        let additive = (order as! Order).additive ?? "nothing"
        
        sizeLabel.text = size
        additiveLabel.text = additive
        nameLabel.text = name
        timeLabel.text = String(timeLeft)
        
        // Do any additional setup after loading the view.
    }
    
    func runTimer() {
        var dontstop = true
        Timer.scheduledTimer(withTimeInterval: 60, repeats: dontstop) { (Timer) in
            self.TIME = self.TIME - 1     //This will decrement(count down)the seconds.
            if(self.TIME >= 0){
                self.timeLabel.text = String(self.TIME)
            }
            else{
                dontstop = false
            }
        }
        
    }

    
    @IBAction func completePressed(_ sender: Any) {
        db = Firestore.firestore()
        let vendor = Vendor.getInstance()
        let currentOrder = vendor.currentOrder
        
        db?.collection((Auth.auth().currentUser?.email)!).document((currentOrder?.email)!).setData(["complete":true], merge: true)
        
        vendor.orders = []
        db?.collection((Auth.auth().currentUser?.email)!).getDocuments
            {
                (querySnapshot, err) in
                if let err = err
                {
                    print("Error getting documents: \(err)");
                }
                else
                {
                    for document in querySnapshot!.documents{
                        //let document = difference.document
                        let orderData = document.data()
                        let order = Order()
                        if((orderData["canceled"] as! Bool) == false){
                            if ((orderData["complete"] as! Bool) == false){
                                order.email = document.documentID
                                order.orderNumber = (orderData["order number"] as? NSNumber)!.intValue
                                order.timeLeft = Int(orderData["Time left"] as! String)!
                                order.name = (orderData["name"] as! String)
                                order.size = (orderData["size"] as! String)
                                order.additive = (orderData["additive"] as! String)
                                vendor.orders.add(order)
                            }
                            else{
                                order.email = document.documentID
                                order.orderNumber = (orderData["order number"] as? NSNumber)!.intValue
                                order.name = (orderData["name"] as! String)
                                order.size = (orderData["size"] as! String)
                                order.additive = (orderData["additive"] as! String)
                                vendor.completedOrders.add(order)
                            }
                        }
                    }
                }
                print("download completed")
        }
        self.dismiss(animated: true, completion: nil)
        
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
