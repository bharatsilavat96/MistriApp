//
//  DetailCategoryVC.swift
//  BookApp
//
//  Created by Bharat Silavat on 08/02/23.
//

import UIKit

class DetailCategoryVC: UIViewController {
   

    var bookListArray: [Book] = []
    var selectedRow: IndexPath?
    
    @IBOutlet weak var bookListCollection: UICollectionView!
    @IBOutlet weak var bookListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bookListCollection.dataSource = self
        bookListTableView.dataSource = self
        self.bookListCollection.isHidden = false
        self.bookListTableView.isHidden = true
    }

    @IBAction func segmentDidValueChange(sender: UISegmentedControl){
        
        if sender.selectedSegmentIndex == 0 {
            self.bookListCollection.isHidden = false
            self.bookListTableView.isHidden = true
        } else {
            self.bookListCollection.isHidden = true
            self.bookListTableView.isHidden = false
        }
    }
    
}



extension DetailCategoryVC: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListTableViewCell", for: indexPath) as! BookListTableViewCell
        cell.selectionStyle = .none
        let imgUrl = bookListArray[indexPath.row].volumeInfo?.imageLinks?.thumbnail ?? ""
        cell.downloadImg(with: imgUrl)
        cell.bookName.textColor = .random()
        cell.bookName.text = bookListArray[indexPath.row].volumeInfo?.title
        cell.autherName.textColor = .purple
        cell.autherName.text = "Auther : \(bookListArray[indexPath.row].volumeInfo?.authors.joined() ?? "Anonymus")"
        cell.languageLbl.text = "Language : \(bookListArray[indexPath.row].volumeInfo?.language ?? "")"
        guard let priceLblData = bookListArray[indexPath.row].volumeInfo?.ratingsCount else {return cell}
        cell.priceLbl.text = "Price : \(priceLblData)"
        guard let pageCountLblData = bookListArray[indexPath.row].volumeInfo?.pageCount else {return cell}
        cell.pageCount.text = "Page Count : \(pageCountLblData)"
        cell.subTittle.text = "\(bookListArray[indexPath.row].volumeInfo?.subtitle ?? "")"
        return cell
    }
}
// MARK: TableViewDelegate -
extension DetailCategoryVC : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = bookListTableView.cellForRow(at: indexPath)  as! BookListTableViewCell
//        cell.sectionForDetail?.isHidden = !cell.sectionForDetail!.isHidden
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = bookListTableView.cellForRow(at: indexPath)  as! BookListTableViewCell
//        if cell.sectionForDetail.isHidden == true{
//            return 190
//        }
        return 400
    }
   
    
}



//MARK: CollectionView Data Source

extension DetailCategoryVC: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        
        let imgUrl = bookListArray[indexPath.row].volumeInfo?.imageLinks?.thumbnail ?? ""
        cell.bookImgView.contentMode = .scaleAspectFill
        cell.downloadImg(with: imgUrl)
        cell.bookName.text = bookListArray[indexPath.row].volumeInfo?.title

        return cell
    }
 
}
extension DetailCategoryVC: UICollectionViewDelegateFlowLayout{
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screen = UIScreen.main.bounds.size
        return CGSize(width: (screen.width - 40)/3, height: 128)
    }
    
    
    
}
