//
//  Vendor.swift
//  Drip Vendors
//
//  Created by Joey Park on 12/5/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Vendor: NSObject {
    var orders : NSMutableArray = []
    var completedOrders : NSMutableArray = []
    var currentOrder : Order? = nil
    public static var vendor : Vendor?
    
    override init() {
        super.init()
    }
    public static func continueCountDown(){
        var dontstop = true
        Timer.scheduledTimer(withTimeInterval: 60, repeats: dontstop){ (Timer) in
            for order in (self.vendor?.orders)!{
                if ((order as! Order).timeLeft >= 0){
                    (order as! Order).timeLeft -= 1
                }
                else{
                    dontstop = false
                }
            }
        }
    }
    public static func getInstance() -> Vendor{
        if(self.vendor == nil){
            self.vendor = Vendor()
        }
        return self.vendor!
    }
    
}
