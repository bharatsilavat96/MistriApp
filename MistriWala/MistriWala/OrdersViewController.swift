//
//  OrdersViewController.swift
//  MistriWala
//
//  Created by Bharat Silavat on 06/02/23.
//

import UIKit

class OrdersViewController: UIViewController {

    
    @IBOutlet weak var ordersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
       
    }
    

    

}
extension OrdersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell", for: indexPath) as! OrdersTableViewCell
        cell.bookedServiceName.text = "Plumber"
        cell.bookingDateTime.text = "10:30 AM , 13-03-2023"
        cell.bookingTypes.text = "HourlyBase"
        cell.bookingAmount.text = "25000"
        return cell
    }
    
    
}
extension OrdersViewController: UITableViewDelegate{
    
}
