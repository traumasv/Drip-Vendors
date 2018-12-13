//
//  CompletedOrderViewController.swift
//  Drip Vendors
//
//  Created by Joey Park on 12/6/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class CompletedOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let vendor = Vendor.getInstance()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (vendor.completedOrders.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let order = (vendor.completedOrders[indexPath.row] as! Order)
        cell.textLabel!.text = order.name! + " ordered " + order.size! + " coffee  with " + order.additive!
        return cell
    }
    

    @IBOutlet weak var completedOrderTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        completedOrderTableView.delegate = self
        completedOrderTableView.dataSource = self
        completedOrderTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
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
