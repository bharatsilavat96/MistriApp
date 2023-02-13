//
//  ViewController.swift
//  CollapsableTableView
//
//  Created by Bharat Silavat on 09/02/23.
//

import UIKit


class ViewController: UIViewController {

    enum BelongsTo: String {
        case india = "India"
        case usa = "USA"
        case australia = "AUSTRALIA"
        case japan = "JAPAN"
    }
    
    var data : [String] = ["Bharat","Swapnil","Raj","Vinay"]
    var belongToArray : [BelongsTo] = [.india,.usa,.australia,.japan]
    var openSection : BelongsTo = .india
    
    @IBOutlet weak var collapsableTB: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collapsableTB.dataSource = self
        collapsableTB.delegate = self
    }
}
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return belongToArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       let openSection = belongToArray[section]
        if openSection == .india{
            return 1
        }

        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let size = UIScreen.main.bounds.size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: 60))
        view.backgroundColor = .cyan
        let viewTextField: UITextField = UITextField()
        viewTextField.layer.masksToBounds = true
        viewTextField.layer.borderWidth = 1
        viewTextField.layer.borderColor = UIColor.white.cgColor
        viewTextField.layer.cornerRadius = 12
        view.addSubview(viewTextField)
        viewTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            viewTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            viewTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            viewTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            viewTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let openableSection = belongToArray[section]
        let sectionBtn: UIButton = UIButton(type: .custom)
        let image = UIImage(systemName: "square.and.arrow.up.circle.fill")!
        sectionBtn.setImage(image, for: .normal)
        sectionBtn.imageView?.contentMode = .scaleAspectFill
        sectionBtn.tag = section
        sectionBtn.backgroundColor = .clear
        sectionBtn.addTarget(self, action: #selector(openRowBtnTapped(sender:)), for: .touchUpInside)
        view.addSubview(sectionBtn)
        sectionBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sectionBtn.heightAnchor.constraint(equalToConstant: 40),
            sectionBtn.widthAnchor.constraint(equalToConstant: 40),
            sectionBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            sectionBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            sectionBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
        ])
        return view
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    @objc func openRowBtnTapped(sender: Any){
        if var button = sender as? UIButton  {
            print("Button Tapped")
            let tag = button.tag
            button.transform = button.transform.rotated(by: 180.0)
            let openSect = belongToArray[tag]
            openSection = openSect
            self.collapsableTB.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    
}
