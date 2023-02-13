//
//  ViewController.swift
//  BookApp
//
//  Created by Bharat Silavat on 07/02/23.
//

import UIKit

class ViewController: UIViewController, CommonDataSourceDelaget {
    
    
    @IBOutlet weak var categoryTable: UITableView!
    let commanDataSource = HomeDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commanDataSource.delegate = self
        categoryTable.delegate = commanDataSource
        categoryTable.dataSource = commanDataSource
        commanDataSource.loadBooks {
        categoryTable.reloadData()
        }
        
    }
    
    func didSelect(category: Category) {
        DispatchQueue.main.async {
            self.categoryTable.reloadData()
            print("CategoryData : \(category.rawValue)")
        }
    }
    
    func goToBookList(for category: Category){
        
        performSegue(withIdentifier: "ListSegueID", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "ListSegueID" {
            guard  let vc = segue.destination as? DetailCategoryVC,
                   let category = sender as? Category  else {return}
            vc.bookListArray = commanDataSource.bookArray(for: category)
        }
    }
    
    
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            if shadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
            
            
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            if let color = self.layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return .clear
            }
        }
        set {
            self.layer.borderColor = newValue.cgColor
            
            
        }
    }
    
    
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    
    @IBInspectable var shadowColor: UIColor {
        get {
            if let color = self.layer.shadowColor {
                return UIColor(cgColor: color)
            } else {
                return .clear
            }
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 3.0) {
        
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
}


