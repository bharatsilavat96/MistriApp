//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Bharat Silavat on 10/02/23.
//

import UIKit


class ViewController: UIViewController {
    
    // Step 4 After Creating model and CoreDataEntries  and Nsobject Classes and chnage in Codent etc.
    var response: Response?
    @IBOutlet weak var showDataTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    // Now Create a blank Array to store Books
    var bookArray: [CDVolumeInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBook { success in
            if success {
                DispatchQueue.main.async {
                    
                    self.showDataTableView.reloadData()
                }
            }
        }
    }
    
    // Step 5 Now make a Function to Get Data From Server Or API - with Closure
    func loadBook(completion: @escaping (Bool)->() ){
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=fiction")!
        // Now Create a Task to DownloadDataTask with Session
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Now check in Data is There Or Not
            guard let data = data else {
                completion(false)
                return
            }
            // Now Parse the Data and Decode It
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data)
                self.response = response
//                self.updateLocalStore(completion: completion)
            } catch let error {
                print(error)
                completion(false)
            }
        }
        task.resume()
    }
    
}




