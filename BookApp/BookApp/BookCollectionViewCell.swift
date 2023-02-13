//
//  BookCollectionViewCell.swift
//  BookApp
//
//  Created by Bharat Silavat on 09/02/23.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    var downloadImg = ImageDownloader()
    @IBOutlet weak var bookImgView: UIImageView!
    @IBOutlet weak var bookName: UILabel!
   
    
    
    
    func downloadImg(with stringImg: String){
        
        ImageDownloader.downloadImage(stringImg) {
            image, urlString in
            if let imageObject = image {
                DispatchQueue.main.async {
                    self.bookImgView.image = imageObject
                    self.bookName.textColor = .magenta
                }
            }
        }
    }
    
    
}
