//
//  OrderTableViewCell.swift
//  Drip Vendors
//
//  Created by Joey Park on 12/6/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit
import Firebase
class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderNumberLabelStatic: UILabel!
    @IBOutlet weak var timeLabelStatic: UILabel!
    @IBOutlet weak var minLabelStatic: UILabel!
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var attachedOrder: Order?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let vendor = Vendor.getInstance()
        vendor.currentOrder = attachedOrder
        // Configure the view for the selected state
    }

}
