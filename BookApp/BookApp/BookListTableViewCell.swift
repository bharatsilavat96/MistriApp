//
//  BookListTableViewCell.swift
//  BookApp
//
//  Created by Bharat Silavat on 09/02/23.
//

import UIKit

class BookListTableViewCell: UITableViewCell {

    var downloadImg = ImageDownloader()
    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var subTittle: UILabel!
    @IBOutlet weak var autherName: UILabel!
    @IBOutlet weak var pageCount: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
//    @IBOutlet weak var sectionForDetail: UIView!
    
    func downloadImg(with stringImg: String){
        ImageDownloader.downloadImage(stringImg) {
            image, urlString in
            if let imageObject = image {
                DispatchQueue.main.async {
                    self.bookImg.image = imageObject
                    self.bookImg.contentMode = .scaleAspectFill
                }
            }
        }
    }
}
