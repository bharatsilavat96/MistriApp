//
//  HomeViewController.swift
//  MistriWala
//
//  Created by Bharat Silavat on 06/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchServicesBar: UISearchBar!
    
//    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
//        "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
//        "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
//        "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
//        "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    var serviceList : [Service] = []
    var searchArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        servicesCollectionView.delegate = self
        servicesCollectionView.dataSource = self

        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchServicesBar.delegate = self
        let layout: UICollectionViewFlowLayout = servicesCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 120, height: 120)
        loadServices()
        
    }
    func loadServices() {
        guard let url = Bundle.main.url(forResource: "Services", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            serviceList = try decoder.decode([Service].self, from: data)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                self.servicesCollectionView.reloadData()
                self.searchTableView.reloadData()
                
            }
        } catch let error {
            print(error)
        }
    }
    
    
    
}

extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return serviceList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
        cell.updateUI(serviceList[indexPath.row])
        searchArray.append(serviceList[indexPath.row].name ?? "")
        return cell
    }
}
extension HomeViewController: UICollectionViewDelegate{
    
}
extension HomeViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
//MARK: - TableView DataSource Delegate -
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceList", for: indexPath)
        cell.textLabel?.text = serviceList[indexPath.row].name
        return cell
    }
    
    
}
extension HomeViewController: UITableViewDelegate{
    
}


extension HomeViewController: UISearchBarDelegate{
    @objc func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         
       serviceList  = searchText.isEmpty ? serviceList : serviceList.filter { (item: Service) -> Bool in
              
           return item.name != nil
           }
           
           searchTableView.reloadData()
       }
    
    
}
