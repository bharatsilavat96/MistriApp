//
//  ServicesCollectionViewCell.swift
//  MistriWala
//
//  Created by Bharat Silavat on 06/02/23.
//

import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var serviceImg: UIImageView!
    @IBOutlet weak var serviceTitle: UILabel!
    
    func updateUI(_ service: Service) {
        self.serviceImg.setCustomImage(service.thumbnailImageUrl)
        self.serviceTitle.text = service.name
    }
    
}
extension UIImageView {

    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "Unknown-2")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "Unknown-2")
            }
        }
    }
}
