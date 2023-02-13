//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Bharat Silavat on 10/02/23.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var warningLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLbl.isHidden = true
        emailField.delegate = self
        passwordField.delegate = self
    }

    @IBAction func MoveToSignUPVC(sender:UIButton){
        
        if (passwordField.text == "Bharat@131021" && emailField.text == "bharat786raj@gmail.com") && (passwordField.text?.isValidPassword() == true && emailField.text?.isValidEmail() == true){
            performSegue(withIdentifier: "HomeSegueId", sender: nil)
            warningLbl.isHidden = true
        }
        else {
            warningLbl.isHidden = false
            warningLbl.text = "You Have Entered Wrong Info Please Try Again"
        }
     
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeSegueId"{
            let homePage = segue.destination as! HomeViewController
        }
        else if segue.identifier == "SignUpSegue" {
            
            let signUpPage = segue.destination as! SignUpViewController
            
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        warningLbl.isHidden = true
        print("DidBeganEditing")
    }
    
    @IBAction func signUpBtn(sender: Any){
        
        performSegue(withIdentifier: "SignUpSegue", sender: nil)
        
    }

}

extension String {
    func isValidEmail() -> Bool {
      let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return ((regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))) != nil)
    }
    
    func isValidName() -> Bool {
      let regex = try! NSRegularExpression(pattern: "[a-zA-Z]+[ a-zA-Z]*")
        return ((regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))) != nil)
    }
    func isValidUserName() -> Bool {
      let regex = try! NSRegularExpression(pattern: "[a-zA-Z]*")
        return ((regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))) != nil)
    }
    func isValidPassword() -> Bool {
      let regex = try! NSRegularExpression(pattern: "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
        return ((regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))) != nil)
    }
    func isValidPhoneNo() -> Bool {
      let regex = try! NSRegularExpression(pattern: "^\\d{10}$")
        return ((regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count))) != nil)
       
    }
}
