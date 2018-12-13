//
//  Order.swift
//  Drip Vendors
//
//  Created by Joey Park on 12/6/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class Order: NSObject {
    var email : String?
    var orderNumber : Int
    var timeLeft : Int
    var name : String?
    var size : String?
    var additive :String?
    var canceled : Bool?
    var complete : Bool?
    var processing : Bool?
    var pickedup : Bool?
    
    override init() {
        orderNumber = 0
        timeLeft = 15
        name = ""
        size = "small"
        additive = "%2"
        canceled = false
        complete = false
        processing = false
        pickedup = false
    }
    
    init(orderNumber: Int, time : Int, customer_name : String, order_size : String ,order_additive : String) {
        self.orderNumber = orderNumber
        timeLeft = time
        name = customer_name
        size = order_size
        additive = order_additive
    }
    func setTimeLeft(time : Int){
        timeLeft = time
    }
    func getTimeLeft (time : Int) -> Int{
        return timeLeft
    }
}
