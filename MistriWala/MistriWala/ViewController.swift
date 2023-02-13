//
//  ViewController.swift
//  MistriWala
//  Created by Bharat Silavat on 06/02/23.

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameView.layer.borderColor = UIColor.systemPink.cgColor
        passwordView.layer.borderColor = UIColor.systemPink.cgColor
        userNameField.delegate = self
        passwordField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if (textField == userNameField) {
            userNameView.layer.borderColor = UIColor.systemYellow.cgColor
        }
        
        if (textField == passwordField) {
            passwordView.layer.borderColor = UIColor.systemYellow.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if (textField == userNameField) {
            userNameView.layer.borderColor = UIColor.systemPink.cgColor
        }
        
        if (textField == passwordField) {
            passwordView.layer.borderColor = UIColor.systemPink.cgColor
        }
    }
}
