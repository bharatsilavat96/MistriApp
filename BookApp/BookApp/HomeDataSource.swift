//
//  HomeDataSource.swift
//  BookApp
//
//  Created by Bharat Silavat on 07/02/23.
//

import UIKit
import Foundation

protocol CommonDataSourceDelaget{
    
    func didSelect(category: Category)
    func goToBookList(for category: Category)
}

enum Category: String {
    case philosophy = "philosophy"
    case nonFiction = "non Fiction"
    case educational = "educational"
}
class HomeDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var sendingData: Any?
    var categoryDict : [Category:[Book]] = [:]
    var categoryArray: [Category] = [.philosophy,.educational,.nonFiction]
    var openCategory: Category = .philosophy
    var delegate: CommonDataSourceDelaget?

    func loadBooks(with completion: ()->()) {
        for key in categoryArray {
            loadBooks(for: key)
        }
        completion()
    }
    
    func bookArray(for category: Category) -> [Book]{
        
        if let categoryBookArray = categoryDict[category] {
         return categoryBookArray
        }
        
        return []
    }
    
    
    func loadBooks(for category: Category) {
    
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(category)")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let data = data else { return  }
            do {
                let decoder = JSONDecoder()
              let response  = try decoder.decode(Response.self, from: data)
                self.categoryDict[category] = response.items
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = categoryArray[section]
        if category == openCategory{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.homeDataSource = self
        cell.updateUI(with: categoryArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let size = UIScreen.main.bounds.size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: 40))
        view.backgroundColor = .cyan
        let categoryNameLbl: UILabel = UILabel()
        let category = categoryArray[section]
        categoryNameLbl.text = category.rawValue.capitalized
        view.addSubview(categoryNameLbl)
        categoryNameLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryNameLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            categoryNameLbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            categoryNameLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            categoryNameLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 5)
        ])
        let sectionBtn: UIButton = UIButton(type: .custom)
        sectionBtn.setTitle("", for: .normal)
        let image = UIImage(named: "DownArrow")
        let transformedImage = image?.rotate(radians: -CGFloat(Double.pi/2))
        if category == openCategory {
            sectionBtn.setImage(image, for: .normal)
        } else {
            sectionBtn.setImage(transformedImage, for: .normal)
        }
        sectionBtn.tag = section
        sectionBtn.backgroundColor = .clear
        sectionBtn.addTarget(self, action: #selector(categoryBtnTapped(sender:)), for: .touchUpInside)
        view.addSubview(sectionBtn)
        sectionBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionBtn.heightAnchor.constraint(equalToConstant: 40),
            sectionBtn.widthAnchor.constraint(equalToConstant: 40),
            sectionBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            sectionBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            sectionBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            
        ])
        sectionBtn.imageView?.contentMode = .scaleAspectFit
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    @objc func categoryBtnTapped(sender: Any){
        if var button = sender as? UIButton {
            let tag = button.tag
            button.transform = button.transform.rotated(by: 180.0)
            let category = categoryArray[tag]
            openCategory = category
            guard let delegate = delegate else {return}
            delegate.didSelect(category: category)
            
        }
    }
    
}

extension HomeDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let categoryBookArray = categoryDict[openCategory] {
            let book: String = categoryBookArray[indexPath.row].volumeInfo?.title ?? ""
            let imgUrl : String = categoryBookArray[indexPath.row].volumeInfo?.imageLinks?.thumbnail ?? ""
            
            if (indexPath.row <= 4){
                cell.thumbnailImg.contentMode = .scaleToFill
                cell.downloadImg(with: imgUrl)
                cell.updateUI(with: book)
                return cell
            } else {
                cell.updateUI(with: "")
                cell.thumbnailImg.backgroundColor = .clear
                cell.thumbnailImg.contentMode = .scaleAspectFit
                cell.thumbnailImg.image = UIImage(named: "NextIcon2")
                return cell
            }
        }
        return cell
    }
}
extension HomeDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = UIScreen.main.bounds.size
        return CGSize(width: (screen.width - 40)/3, height: 128)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item is tapped")
        if indexPath.item == 5 {
            guard let delegate = delegate else {return}
            delegate.goToBookList(for: openCategory)
            
        }
    }
    
  
}
extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}
