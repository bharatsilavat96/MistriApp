//
//  SignUpViewController.swift
//  CoreDataProject
//
//  Created by Bharat Silavat on 11/02/23.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var signUpEmailField: UITextField!
    @IBOutlet weak var signUpFirstNameField: UITextField!
    @IBOutlet weak var signUpLastNameField: UITextField!
    @IBOutlet weak var signUpPasswordFieldField: UITextField!
    @IBOutlet weak var signUpDOBField: UITextField!
    @IBOutlet weak var warningLbl: UILabel!
    
    var email: String = ""
    var password: String = ""
    var firstname: String = ""
    var lastName: String = ""
    var dob: String = ""
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningLbl.isHidden = true
        signUpEmailField.delegate = self
        signUpFirstNameField.delegate = self
        signUpLastNameField.delegate = self
        signUpPasswordFieldField.delegate = self
        signUpDOBField.delegate = self
    }
    
    
    @IBAction func signUpBtn(sender: Any){
            
        email = signUpEmailField.text ?? ""
        password = signUpPasswordFieldField.text ?? ""
        firstname = signUpFirstNameField.text ?? ""
        lastName = signUpLastNameField.text ?? ""
        dob = signUpDOBField.text ?? ""
        print(email,password,firstname,lastName,dob)
        self.dismiss(animated: true)
        }
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        warningLbl.isHidden = true
        
    }
        
        
        
    }
