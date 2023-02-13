//
//  HomeViewController.swift
//  CoreDataProject
//
//  Created by Bharat Silavat on 11/02/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        withoutTypeEnum1Case()
//        withoutTypeEnum2Case()
        withTypeEnum()
        withoutRawValue()
    }

// Enum withOut type
enum UserLogin{
    
    case loginEmail
    case loginPassword
    
}
enum SignUpUser{
    case userEmail
    case userPassword
    case userFirstName
    case userLastName
    case userDob
}
enum ForgotPassword{
    case newPassword
}

func withoutTypeEnum1Case(){
    
    let userDetail = SignUpUser.userEmail
    print("UserSignUpDetail: \(userDetail)")
    
}
    func withoutTypeEnum2Case(){
        
        let userDetail = SignUpUser.userPassword
        // Cheking hashValue of case by BreakPoint
        let hashvalue = SignUpUser.userPassword.hashValue
        print(hashvalue)
        switch userDetail{
        case .userEmail:
            print("bharat786Raj@gmail.com")
        case .userFirstName:
            print("Bharat")
        case .userLastName:
            print("Silavat")
        case.userPassword:
            print("Bharat@123")
        case .userDob:
            print("12-09-2022")
            // It will print Only One Condition that is .userEmail so you need to change line no 45 Code to .other
        }
    }
    func withoutRawValue(){
        var withoutRaw : [SignUp] = [.userEmail,.userFirstName,.userLastName,.userPassword,.userDob]
        print("withOutRawValue: \(withoutRaw)")
        
    }
}
// Enum with Type
// Now you can pass All the values here right away - with rawvalue
enum Login: String {
    
    case loginEmail = "bharatraj@1123"
    case loginPassword = "bharat67576"
    
}
enum SignUp: String{
    case userEmail = "bharatraj@1123"
    case userPassword = "bharat67576"
    case userFirstName = "Bharat"
    case userLastName = "Silavat"
    case userDob = "16-06-1996"
}
enum ForgotPass: String{
    case newPassword = "bharat675766565"
}
func withTypeEnum(){
    
    let userEmail = SignUp.userEmail.rawValue
    print(userEmail)
}
