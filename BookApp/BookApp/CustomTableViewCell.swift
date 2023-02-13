//
//  CustomTableViewCell.swift
//  BookApp
//
//  Created by Bharat Silavat on 07/02/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var homeDataSource: HomeDataSource?
    var category: Category?
    
    @IBOutlet weak var bookCollectionView: UICollectionView!
    
    func updateUI(with category: Category){
        self.category = category
        guard let homeDataSource = homeDataSource else {
            return
        }
        bookCollectionView.delegate = homeDataSource
        bookCollectionView.dataSource = homeDataSource
        bookCollectionView.reloadData()
        
    }
}
